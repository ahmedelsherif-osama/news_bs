import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_bs/article_widget.dart';
import 'package:news_bs/cubit.dart';
import 'package:news_bs/dio.dart';
import 'package:news_bs/shared_appbar_widget.dart';
import 'package:news_bs/shared_drawer_widget.dart';

class SourceWidget extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => SourceWidget());

  SourceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final fontSize = (height + width) / 100;

    final source = context.read<TestCubit>().getSource();
    print("source habibi ${source}");
    final data = context.read<TestCubit>().getData();
    print(data);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.09),
          child: SharedAppBarWidget()),
      drawer: const SharedDrawerWidget(),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var urlToImage = data[index]['urlToImage'];
                var title = data[index]['title'];
                var description = data[index]['description'];
                var url = data[index]['url'];
                var publishedAt = data[index]['publishedAt'];
                var author = data[index]['author'];
                var sourceName = data[index]['sourceName'];

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
                          context.read<TestCubit>().changeData(data[index]);
                          context.go('/article');
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
      ),
    );
  }
}
