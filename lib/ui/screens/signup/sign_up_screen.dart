import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  static const String pathName = "signup_screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("signup screen")
          ],
        ),
      ),
    );
  }
}