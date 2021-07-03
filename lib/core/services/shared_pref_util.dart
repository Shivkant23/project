import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:omnirio/core/models/response/login_reponse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPrefUtil {
  static SharedPreferences sp;

  static const _IS_USER_LOGIN = "isUserLogin";
  static const _USER_EMAIL = "userEmail";
  static const _USER_PASSWORD = "userpassword";
  static const _REMEMBER_ME = "rememberMe";

  static initialize() async {
    sp = await SharedPreferences.getInstance();
  }

  static Future<bool> getUserLogin() async {
    String result;
    if (TargetPlatform.android == defaultTargetPlatform ||
        TargetPlatform.iOS == defaultTargetPlatform) {
      result = await FlutterSecureStorage().read(key: _IS_USER_LOGIN);
    } else {
      result = sp.getString(_IS_USER_LOGIN) ?? "0";
    }
    return (result ?? "0") == "1" ? true : false;
  }

  static bool getRememberMe() {
    return sp.getBool(_REMEMBER_ME) ?? false;
  }

  static void setRememberMe(bool status) {
    sp.setBool(_REMEMBER_ME, status);
  }

  static bool getLoggedInStatus() {
    return sp.getBool(_IS_USER_LOGIN) ?? false;
  }

  static void setLoggedInStatus(bool isloggedIn) {
    sp.setBool(_IS_USER_LOGIN, isloggedIn);
  }

  static String getEmail() {
    return sp.getString(_USER_EMAIL) ?? "";
  }

  static void setEmail(String email) {
    sp.setString(_USER_EMAIL, email);
  }

  static String getPassword() {
    return sp.getString(_USER_PASSWORD) ?? "";
  }

  static void setPassword(String password) {
    sp.setString(_USER_PASSWORD, password);
  }

  static void clear() {
    sp.clear();
  }
}
