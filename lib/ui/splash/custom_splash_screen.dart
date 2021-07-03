import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:omnirio/core/services/shared_pref_util.dart';
import 'package:omnirio/ui/screens/home_screen.dart';
import 'package:omnirio/ui/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  final Function customFunction;
  final String assetImagePath;
  SplashScreen(
      {this.customFunction, this.assetImagePath});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this, duration: new Duration(milliseconds: 1500));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => this.setState(() {}));
    animationController.forward();
    startTimeout();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  startTimeout() async {
    var duration = const Duration(seconds: 1);
    return new Timer(
        duration,
        () =>
            widget.customFunction().then((GlobalKey<NavigatorState> key) async {
              Future.delayed(Duration(milliseconds: 1000))
                    .then((value) async {
                  try {
                    bool isLogin = await SharedPrefUtil.getUserLogin();
                    String nextScreen = isLogin
                        ? HomeScreen.afterLoginId
                        : LoginScreen.pathName;
                    Navigator.of(context).pushReplacementNamed(nextScreen);
                  } catch (e) {
                    print(e);
                    return;
                  }
                });
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2c2c5e),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            // color: Colors.purple
          ),
          child: Image.asset(widget.assetImagePath),
        ),
      )
    );
  }

  _noInternetDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return WillPopScope(
                onWillPop: () async => false,
                child: new CupertinoAlertDialog(
                  title: Text("No Internet"),
                  actions: <Widget>[
                    FlatButton(
                        child:
                            Text("OK"),
                        onPressed: () {
                          Platform.isAndroid ? SystemNavigator.pop() : exit(0);
                        }),
                  ],
                ));
          });
        });
  }
}