import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bs/article_page.dart';
import 'package:news_bs/cubit.dart';
import 'package:news_bs/firebase_options.dart';
import 'package:news_bs/landing_page.dart';
import 'package:news_bs/home_page.dart';
import 'package:news_bs/search_results_page.dart';
import 'package:news_bs/signin_screen.dart';
import 'package:news_bs/signup_screen.dart';
import 'package:news_bs/some_category_widget.dart';
import 'package:news_bs/source_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final email = prefs.getString('email');
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web,
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null
          ? BlocProvider(
              create: (_) => TestCubit(data: null),
              child: LandingPage(),
            )
          : BlocProvider(
              create: (_) => TestCubit(data: null),
              child: HomePage(),
            ),
      routes: {
        '/home': (context) => HomePage(),
        '/landing': (context) => LandingPage(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/category': (context) => SomeCategoryWidget(),
        '/source': (context) => SourceWidget(),
        '/somecategory': (context) => SomeCategoryWidget(),
        '/article': (context) => ArticlePage(),
      },
    ),
  );
}
