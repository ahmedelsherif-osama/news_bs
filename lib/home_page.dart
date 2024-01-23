import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_bs/category_card.dart';
import 'package:news_bs/cubit.dart';
import 'package:news_bs/dio.dart';
import 'package:news_bs/shared_appbar_widget.dart';
import 'package:news_bs/shared_drawer_widget.dart';
import 'package:news_bs/some_category_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => HomePage());
  // void openURL(String url) async {
  //   if (await canLaunchUrlString(url)) {
  //     await launchUrlString(url);
  //   } else {
  //     print('Could not launch $url');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final category = '';

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.09),
          child: SharedAppBarWidget()),
      drawer: SharedDrawerWidget(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(screenWidth * 0.0303),
                shrinkWrap: false,
                crossAxisSpacing: screenWidth * 0.045,
                mainAxisSpacing: screenHeight * 0.045,
                crossAxisCount: 2,
                children: [
                  CategoryCard(
                    onTap: () {
                      context.read<TestCubit>().selectCategory('sports');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SomeCategoryWidget()));
                    },
                    title: 'Sports',
                    icon: Icons.sports,
                    screenWidth: screenWidth * 0.5,
                    screenHeight: screenHeight,
                  ),
                  CategoryCard(
                    onTap: () {
                      context.read<TestCubit>().selectCategory('health');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SomeCategoryWidget()));
                    },
                    title: 'Health',
                    icon: Icons.heat_pump_rounded,
                    screenWidth: screenWidth * 0.1,
                    screenHeight: screenHeight,
                  ),
                  CategoryCard(
                    onTap: () {
                      context.read<TestCubit>().selectCategory('business');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SomeCategoryWidget()));
                    },
                    title: 'Business',
                    icon: Icons.business,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  CategoryCard(
                    onTap: () {
                      context.read<TestCubit>().selectCategory('science');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SomeCategoryWidget()));
                    },
                    title: 'Science',
                    icon: Icons.science,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  CategoryCard(
                    onTap: () {
                      context.read<TestCubit>().selectCategory('entertainment');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SomeCategoryWidget()));
                    },
                    title: 'Entertainment',
                    icon: Icons.movie,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  CategoryCard(
                    onTap: () {
                      context.read<TestCubit>().selectCategory('technology');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SomeCategoryWidget()));
                    },
                    title: 'Technology',
                    icon: Icons.computer,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  CategoryCard(
                    onTap: () {
                      context.read<TestCubit>().selectCategory('general');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SomeCategoryWidget()));
                    },
                    title: 'General',
                    icon: Icons.public,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
