import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_bs/dio.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
    this.urlToImage,
    this.title,
    this.description,
    this.url,
    this.publishedAt,
    this.author,
    this.sourceName,
    this.onTap,
  }) : super(key: key);
  final urlToImage;
  final title;
  final description;
  final url;
  final publishedAt;
  final author;
  final sourceName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final fontSize = (height + width) / 100;

    if (urlToImage == null) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                    width: width * .05,
                  ),
                  Text(
                    title ?? "",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  SizedBox(
                    height: height * 0.05,
                    width: width * .05,
                  ),
                  Text(description ?? ""),
                  SizedBox(
                    height: height * 0.05,
                    width: width * .05,
                  ),
                  Text(url ?? ""),
                  SizedBox(
                    height: height * 0.05,
                    width: width * .05,
                  ),
                  Text(publishedAt ?? ""),
                  SizedBox(
                    height: height * 0.05,
                    width: width * .05,
                  ),
                  Text(author ?? ""),
                  SizedBox(
                    height: height * 0.05,
                    width: width * .05,
                  ),
                  Text(sourceName ?? ""),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          child: Card(
            child: Column(
              children: [
                Image.network(
                  urlToImage,
                ),
                Text(
                  title ?? "",
                  style: TextStyle(fontSize: height * 1.1 * 0.03),
                ),
                Text(
                  description ?? "",
                  style: TextStyle(fontSize: height * 1.1 * 0.0231),
                ),
                Text(
                  url ?? "",
                  style: TextStyle(
                      color: Colors.grey, fontSize: height * 1.1 * 0.02),
                ),
                Text(
                  publishedAt ?? "",
                  style: TextStyle(
                      fontSize: height * 1.1 * 0.02,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
