import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  static const String afterLoginId = "AfterLoginHomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}