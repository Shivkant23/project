
import 'package:flutter/material.dart';
import 'package:omnirio/app_config.dart/app_config.dart';

import 'constants.dart';

ThemeData themeData(BuildContext context) {
  TextTheme textTheme = TextTheme(
//      headline5: TextStyle(color: Colors.black87, fontSize: 18),
      bodyText1: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      bodyText2: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      subtitle2: TextStyle(fontSize: 12, color: Colors.grey.shade600));
  return ThemeData(
      primaryColor: Color(0xFF00bcd7),
      accentColor: Color(0xFF222222),
      primaryIconTheme:
          Theme.of(context).primaryIconTheme.copyWith(color: Colors.white),
      primaryTextTheme:
          Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.white),
      appBarTheme: AppBarTheme(
//          color: Color(0xFFf1f5fa),
          color: Colors.white,
          textTheme: textTheme,
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: textTheme,
      // inputDecorationTheme: getInputDecorationThem(context)
//    inputDecorationTheme: InputDecorationTheme(
//      hintStyle: TextStyle(
//        color: Colors.black45,
//        fontSize: null,
//        fontWeight: FontWeight.w400,
//        fontStyle: FontStyle.normal,
//      ),
//      errorStyle: TextStyle(
//        color: Colors.red,
//        fontSize: null,
//        fontWeight: FontWeight.w400,
//        fontStyle: FontStyle.normal,
//      ),
//      errorMaxLines: null,
//      hasFloatingPlaceholder: true,
//      isDense: false,
//      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//      isCollapsed: false,
////      fillColor: Color.fromARGB(255, 245, 245, 245),
//      errorBorder: OutlineInputBorder(
//        borderSide: BorderSide(color: Colors.red, width: 1.0),
//        borderRadius: BorderRadius.all(Radius.circular(8.0)),
//      ),
//      focusedErrorBorder: OutlineInputBorder(
//        borderSide:
//            BorderSide(color: AppConfig.of(context).appAccentColor, width: 1.0),
//        borderRadius: BorderRadius.all(Radius.circular(8.0)),
//      ),
//      disabledBorder: OutlineInputBorder(
//        borderSide: BorderSide(
//          color: Color(0xff000000),
//          width: 1,
//          style: BorderStyle.solid,
//        ),
//        borderRadius: BorderRadius.all(Radius.circular(8.0)),
//      ),
//      enabledBorder: OutlineInputBorder(
//        borderSide:
//            BorderSide(color: Color.fromARGB(255, 245, 245, 245), width: 1.0),
//        borderRadius: BorderRadius.all(Radius.circular(8.0)),
//      ),
//      focusedBorder: OutlineInputBorder(
//        borderSide:
//            BorderSide(color: AppConfig.of(context).appAccentColor, width: 1.0),
//        borderRadius: BorderRadius.all(Radius.circular(8.0)),
//      ),
//      border: OutlineInputBorder(
//        borderRadius: BorderRadius.all(Radius.circular(8.0)),
//      ),
//    ),
//    brightness: Brightness.light,
//    primaryColor: primaryColor,
//    accentColor: primaryColor,
//    sliderTheme: SliderThemeData(
//      thumbSelector: customRangeThumbSelector,
//    ),
//    appBarTheme: AppBarTheme(
//        brightness: Brightness.light,
//        actionsIconTheme: IconThemeData(color: Colors.white),
//        iconTheme: IconThemeData(color: Colors.white)),
      );
//  return ThemeData(
//    primaryColor: primaryColor,
//    accentColor: accentColor,
////      appBarTheme: AppBarTheme(
////        brightness: Brightness.dark,
////      )
////    appBarTheme: AppBarTheme(
////        actionsIconTheme: IconThemeData(color: Colors.white),
////        iconTheme: IconThemeData(color: Colors.white)),
//  );
}
//
//InputDecorationTheme getDefaultInputDecorationThem(BuildContext context) {
//  InputDecorationTheme defaultInputTheme = InputDecorationTheme(
//    labelStyle: TextStyle(
//      color: Colors.black45,
//      fontSize: null,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    helperStyle: TextStyle(
//      color: Colors.black45,
//      fontSize: null,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    hintStyle: TextStyle(
//      color: Colors.black45,
//      fontSize: null,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    errorStyle: TextStyle(
//      color: Colors.red,
//      fontSize: null,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    errorMaxLines: null,
//    hasFloatingPlaceholder: true,
//    isDense: false,
//    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//    isCollapsed: false,
//    prefixStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: null,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    suffixStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: null,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    counterStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: null,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    filled: true,
//    fillColor: Color.fromARGB(255, 255, 255, 255),
//    errorBorder: OutlineInputBorder(
//      borderSide: BorderSide(color: Colors.red, width: 1.0),
//      borderRadius: BorderRadius.all(Radius.circular(8.0)),
//    ),
//    focusedErrorBorder: OutlineInputBorder(
//      borderSide:
//          BorderSide(color: AppConfig.of(context).appAccentColor, width: 1.0),
//      borderRadius: BorderRadius.all(Radius.circular(8.0)),
//    ),
//    disabledBorder: OutlineInputBorder(
//      borderSide: BorderSide(
//        color: Color(0xff000000),
//        width: 1,
//        style: BorderStyle.solid,
//      ),
//      borderRadius: BorderRadius.all(Radius.circular(8.0)),
//    ),
//    enabledBorder: OutlineInputBorder(
//      borderSide:
//          BorderSide(color: Color.fromARGB(255, 245, 245, 245), width: 1.0),
//      borderRadius: BorderRadius.all(Radius.circular(8.0)),
//    ),
//    focusedBorder: OutlineInputBorder(
//      borderSide:
//          BorderSide(color: AppConfig.of(context).appAccentColor, width: 1.0),
//      borderRadius: BorderRadius.all(Radius.circular(8.0)),
//    ),
//    border: OutlineInputBorder(
//      borderRadius: BorderRadius.all(Radius.circular(8.0)),
//    ),
//  );
//  return defaultInputTheme;
//}

InputDecorationTheme getInputDecorationThem(BuildContext context) {
  InputDecorationTheme textInputTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.black45,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Colors.red,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorMaxLines: null,
    hasFloatingPlaceholder: true,
    isDense: false,
    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
    isCollapsed: false,
    filled: true,
    fillColor: Colors.grey.shade200,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: AppConfig.of(context).appAccentColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: AppConfig.of(context).appAccentColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
    ),
  );
  return textInputTheme;
}
