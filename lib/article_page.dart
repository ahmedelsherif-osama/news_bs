import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bs/article_widget.dart';
import 'package:news_bs/cubit.dart';
import 'package:news_bs/shared_appbar_widget.dart';
import 'package:news_bs/shared_drawer_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticlePage extends StatelessWidget {
  void openURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = context.read<TestCubit>().getData();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
          child: const SharedAppBarWidget()),
      drawer: const SharedDrawerWidget(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ArticleWidget(
            urlToImage: data['urlToImage'],
            title: data['title'],
            description: data['description'],
            url: data['url'],
            publishedAt: data['publishedAt'],
            onTap: () {
              openURL(data['url']);
            },
          ),
        ],
      ),
    );
  }
}
