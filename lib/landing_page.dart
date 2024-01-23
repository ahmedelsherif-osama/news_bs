import 'package:flutter/material.dart';
import 'package:news_bs/home_page.dart';
import 'package:news_bs/signin_screen.dart';
import 'package:news_bs/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => LandingPage());

  Future checkIfUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    if (email != null && password != null) {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkIfUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.data == false) {
            return HomePage();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Landing Page'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInScreen();
                        }));
                      },
                      child: const Text('Sign In'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
