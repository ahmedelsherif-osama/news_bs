import 'package:flutter/material.dart';
import 'package:news_bs/signin_form.dart';

class SignInScreen extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => SignInScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SignInForm(),
    );
  }
}
