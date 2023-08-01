import 'package:flutter/material.dart';
import 'package:login_form_validation/Screens/LoginScreen.dart';

class HomeScreen extends StatelessWidget {
  final String? message;
  HomeScreen({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    print(args);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Welcome to My HomeScreen $args")),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => LoginScreen()),
                  //     (route) => false);
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/login", (route) => false);
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
