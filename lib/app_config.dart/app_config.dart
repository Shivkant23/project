import 'package:flutter/material.dart';


enum appMode{TEST, PRODUCTION}

class AppConfig extends InheritedWidget { 
  AppConfig(
      {this.appDisplayName,
      this.appRunningMode = appMode.PRODUCTION,
      this.appPrimaryColor,
      this.appAccentColor,
      this.appInternalId,
      this.homeAppTitle,
      this.appLogoIcon,
      this.requiredFeaturesId,
      this.contactNumber,
      this.paymentUrl,
      this.newVrPaymentUrl,
      this.clubBaseUrl,
      this.bookingMode,
      this.loginBgColor,
      this.splashColor,
      this.paymentStatusCallbackUrl,
      this.appVersion,
      this.errorImageColorCode,
      this.splashImage,
      this.initialCurrency,
      this.clubEmail,
      this.isCurrencyAvailable = true,
      this.isMemberMouse,
      this.introHeaderText,
      this.introSubtitleText,
      this.isMultiLanguageSupported = false,
      this.isIntroScreens = false,
      this.isAllInputsInEnglishOnly = false,
      this.iosAppleId,
      this.memberSupportNumber,
      this.memberSupportEmail,
      Widget child})
      : super(child: child);

  final String appDisplayName;
  final appMode appRunningMode;
  final String appLogoIcon;
  final String appVersion;
  final String paymentUrl;
  final String newVrPaymentUrl;
  final String paymentStatusCallbackUrl;
  final String homeAppTitle;
  final String contactNumber;
  final String initialCurrency;
  final String clubBaseUrl;
  final int appInternalId;
  final String errorImageColorCode;
  final bool isMultiLanguageSupported;
  final bool isAllInputsInEnglishOnly;
  final String memberSupportNumber;
  final String memberSupportEmail;

  int bookingMode;
  final Color appPrimaryColor;
  final Color loginBgColor;
  final Color splashColor;
  final String splashImage;
  final String clubEmail;

  final List<int> requiredFeaturesId;
  final Color appAccentColor;
  final bool isCurrencyAvailable;
  final bool isIntroScreens;
  final bool isMemberMouse;
  final String iosAppleId;
  final String introHeaderText;
  final String introSubtitleText;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

class WebServiceData {
  String mainApiUrl;
  String mainApiKey;
  String updateApiUrl;
  String updateApiKey;
  String hotelApiUrl;
  String hotelApiKey;

  WebServiceData({
    this.mainApiUrl,
    this.mainApiKey,
    this.updateApiUrl,
    this.updateApiKey,
    this.hotelApiUrl,
    this.hotelApiKey,
  });
}