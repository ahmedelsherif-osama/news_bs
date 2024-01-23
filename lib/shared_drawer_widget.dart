import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedDrawerWidget extends StatelessWidget {
  const SharedDrawerWidget({Key? key}) : super(key: key);
  Future logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("email");
    Navigator.pushReplacementNamed(context, '/landing');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.09,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Center(
                child: Text(
                  'TIMES news',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
              )),
          GestureDetector(
            onTap: () {
              context.pushReplacement('/');
            },
            child: const Row(
              children: [
                Icon(Icons.category),
                Text("Category"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print("object");
            },
            child: const Row(
              children: [
                Icon(Icons.settings),
                Text("Settings"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              logout(context);
            },
            child: const Row(
              children: [
                Icon(Icons.settings),
                Text("Logout"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
