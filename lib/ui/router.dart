import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:omnirio/ui/screens/home_screen.dart';
import 'package:omnirio/ui/screens/login/login_screen.dart';
import 'package:omnirio/ui/screens/signup/sign_up_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(),
            settings: RouteSettings(name: HomeScreen.id));
      case HomeScreen.afterLoginId:
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 800),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.easeInOutCirc);
            return ScaleTransition(
                child: child,
                scale: animation,
                alignment: Alignment.bottomCenter);
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return HomeScreen();
          },
        );
      case LoginScreen.pathName:
        return PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 800),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.easeInCubic);
//                parent: animation, curve: Curves.linearToEaseOut);
//                CurvedAnimation(parent: animation, curve: Curves.easeInOutBack);
            return ScaleTransition(
                child: child,
                scale: animation,
                alignment: Alignment.bottomCenter);
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return LoginScreen();
          },
        );
      case SignUpScreen.pathName:
        return MaterialPageRoute(
            builder: (_) => SignUpScreen(),
            settings: RouteSettings(name: SignUpScreen.pathName));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
