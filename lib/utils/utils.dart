import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omnirio/locator.dart';


const List<String> titleList = ["Mr", "Mrs", "Miss"];
const List<String> hotelTitleList = ["Mr", "Mrs", "Ms"];
const List<String> flightTitleList = ["Mr", "Miss"];
const List<String> additionalTitleList = [
  "Mr",
  "Mrs",
  "Ms",
  "Mstr",
  "Miss",
  "Dr"
];

const List<String> eanSupplierId = [
  'en-t',
  'enb2c-t',
  'enb2b-t',
  'ean-live-mod',
  'ean-live-nonmod'
];
const List<String> genderList = ["Male", "Female"];

const List<String> childAgesList = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
];
String usDollarSign = String.fromCharCodes(new Runes("\u0024"));

DateFormat customDateAndTimeFormat = DateFormat("MMM dd, hh:mm aaa");
DateFormat customFullDateAndFullTimeFormat = DateFormat("MM/dd/yyyy hh:mm aaa");
DateFormat customDateFormat = DateFormat("dd MMM");
DateFormat customDateOnlyFormat = DateFormat("dd");
DateFormat customMonthAndYearOnlyFormat = DateFormat("MMM yyyy");
DateFormat customDayOnlyFormat = DateFormat("EEE");
DateFormat customDayAndMonthFormat = DateFormat("EEE, MMM dd");
DateFormat timeFormat = DateFormat("hh:mm aaa");
DateFormat hourAndMinutesFormat = DateFormat("hh:mm");
DateFormat hourShowFormat = DateFormat("aaa");
DateFormat customFullDateFormat = DateFormat("dd-MMM-yyyy");
DateFormat customMonthAndYearFormat = DateFormat("MMM yyyy");
DateFormat customWeekOfDayFormat = DateFormat.E();
DateFormat apiDateFormat = DateFormat("yyyy-MM-dd");
DateFormat passportExpiryDateFormat = DateFormat("MM/dd");
DateFormat apiTimeFormat = DateFormat.Hm();
DateFormat fullDateTimeFormat = DateFormat("dd MMM yyyy hh:mm aaa");
DateFormat customTimeFormat = DateFormat("hh:mm aaa");
DateFormat fullDateFormat = DateFormat("EEE, dd MMM yyyy");
DateFormat formattedDateFormat = DateFormat("dd, MMM yyyy");

TextStyle largeHeadingStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
TextStyle customHeadingStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
TextStyle mediumHeadingStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
TextStyle customSubtitleStyle =
    TextStyle(fontSize: 12, color: Colors.grey.shade600);
TextStyle smallStyle = TextStyle(fontSize: 16);
TextStyle customStyle = TextStyle(fontSize: 18);
TextStyle buttonTextOutlineStyle = TextStyle(fontSize: 16);
//small //medium //large
double mediumDevice;
double largeDevice;

bool isEmail(String em) {
  String p = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

bool isMobile(String em) {
  String p = r"^([+]\d{2}[ ])?\d{10}$";
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

bool isRecurringNumber(String em) {
  String p = r"\b(\d)\1+\b";
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

bool isLoginPassword(String em) {
  String p = r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

bool isPassword(String em) {
  String p = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

Future<bool> checkInternet() async {
  return locator<Connectivity>().checkConnectivity().then((value) async {
    if (value == ConnectivityResult.mobile) {
      return true;
    } else if (value == ConnectivityResult.wifi) {
      return true;
    } else {
      BotToast.showText(text: "No Internet Connection");
      return false;
    }
  });
}


void showErrorMessage(String message) {
  BotToast.showText(
      contentPadding: EdgeInsets.all(12),
      animationDuration: Duration(seconds: 1),
      duration: Duration(seconds: 2),
      contentColor: Colors.redAccent,
      text: message);
}

void showSuccessMessage(String message) {
  BotToast.showText(
      contentPadding: EdgeInsets.all(12),
      animationDuration: Duration(seconds: 1),
      duration: Duration(seconds: 2),
      contentColor: Colors.greenAccent,
      text: message);
}