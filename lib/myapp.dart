import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:omnirio/core/services/shared_pref_util.dart';
import 'package:omnirio/locator.dart';
import 'package:omnirio/ui/router.dart' as router;
import 'package:flutter/material.dart';
import 'package:omnirio/app_config.dart/app_config.dart';
import 'package:omnirio/core/models/response/login_reponse_model.dart';
import 'package:omnirio/ui/splash/custom_splash_screen.dart';
import 'package:omnirio/utils/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  final WebServiceData webServiceConfig;
  MyApp({ this.webServiceConfig});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final botToastBuilder = BotToastInit(); //1. call BotToastInit

  @override
  void initState() {
    super.initState();
  }

  bool isInitialized = false;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginResponseModel()),
        ],
        child: MaterialApp(
          builder: (BuildContext context, Widget child) {
            BotToastInit();
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: 0.9,
              ),
//                      data.textScaleFactor > 1.0 ? 2.0 : data.textScaleFactor),
              child: botToastBuilder(context, child),
            );
          },
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: themeData(context),
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          onGenerateRoute: router.Router.generateRoute,
          home: SplashScreen(
            assetImagePath:
                'assets/logo.jfif',
            customFunction: () async {
              if (!isInitialized) {
                try {
                  isInitialized = true;
                  await SharedPrefUtil.initialize();
                  // value.changeLanguage(Locale(SharedPrefUtil.getAppLanguage()),
                  //     SharedPrefUtil.getAppLanguageInfo());
                  // if (TargetPlatform.android == defaultTargetPlatform ||
                  //     TargetPlatform.iOS == defaultTargetPlatform) {
                  //   await Firebase.initializeApp();
                  //   FlutterError.onError =
                  //       FirebaseCrashlytics.instance.recordFlutterError;
                  // }
                  await setupLocator(widget.webServiceConfig);
                } catch (e) {
                  print(e);
                }
              }
              await Future.delayed(Duration(seconds: 1));
              return navigatorKey;
            },
          ),
        ),
      );
  }
}
