import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_bs/article_page.dart';
import 'package:news_bs/article_widget.dart';
import 'package:news_bs/cubit.dart';
import 'package:news_bs/dio.dart';
import 'package:news_bs/shared_appbar_widget.dart';
import 'package:news_bs/shared_drawer_widget.dart';
import 'package:news_bs/source_widget.dart';

class SearchResultsPage extends StatelessWidget {
  SearchResultsPage({Key? key, required searchKeyword}) : super(key: key);
  var searchKeyword;

  Future search(searchKeyword) async {
    String data = "";

    Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=$searchKeyword&sortBy=popularity&apiKey=1bd9ed90ffb4460ca9cb10df1f19fac2');
    Map<String, dynamic> decodedString = json.decode(response.toString());
    decodedString['articles'].forEach((element) {
      data += element['title'];
    });
    print(decodedString);
    return decodedString;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final fontSize = (height + width) / 100;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.09),
          child: SharedAppBarWidget()),
      drawer: const SharedDrawerWidget(),
      body: FutureBuilder(
        future: search(searchKeyword),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var sources = snapshot.data['articles']
                .map((e) {
                  return e['source']['name'];
                })
                .toSet()
                .toList();

            var sourceIDs = snapshot.data['articles']
                .map((e) {
                  print("source id ${e['source']['id']}");
                  return e['source']['id'];
                })
                .toSet()
                .toList();
            return Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.1,
                  child: Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: sources.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: width / (sources.length / 2),
                          height: height * 0.1,
                          child: TextButton(
                            onPressed: () {
                              print("object");
                              var filteredDataBySource = snapshot
                                  .data['articles']
                                  .where((element) =>
                                      element['source']['name'] ==
                                      sources[index])
                                  .toList();
                              context
                                  .read<TestCubit>()
                                  .changeSource(sources[index]);
                              context
                                  .read<TestCubit>()
                                  .changeData(filteredDataBySource);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SourceWidget()));
                            },
                            child: Text(
                              sources[index],
                              style: TextStyle(
                                fontSize: fontSize,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data['articles'].length,
                    itemBuilder: (context, index) {
                      var urlToImage =
                          snapshot.data['articles'][index]['urlToImage'];
                      var title = snapshot.data['articles'][index]['title'];
                      var description =
                          snapshot.data['articles'][index]['description'];
                      var url = snapshot.data['articles'][index]['url'];
                      var publishedAt =
                          snapshot.data['articles'][index]['publishedAt'];
                      var author = snapshot.data['articles'][index]['author'];
                      var sourceName =
                          snapshot.data['articles'][index]['sourceName'];

                      if (title.toString().contains("removed") ||
                          description.toString().contains("removed") ||
                          url.toString().contains("removed") ||
                          publishedAt.toString().contains("removed") ||
                          author.toString().contains("removed") ||
                          sourceName.toString().contains("removed")) {
                        return SizedBox.shrink();
                      } else {
                        return Column(
                          children: [
                            ArticleWidget(
                              urlToImage: urlToImage,
                              title: title ?? "",
                              url: url ?? "",
                              publishedAt: publishedAt ?? "",
                              onTap: () {
                                context.read<TestCubit>().changeData(
                                    snapshot.data['articles'][index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ArticlePage()));
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return Text("loading");
          }
        },
      ),
    );
  }
}
