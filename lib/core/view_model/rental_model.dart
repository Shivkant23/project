import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:omnirio/core/models/response/login_reponse_model.dart';
import 'package:omnirio/core/services/service.dart';
import 'package:omnirio/core/view_model/base_model.dart';
import 'package:omnirio/locator.dart';
import 'package:provider/provider.dart';

class LoginModel extends BaseModel {
  final LoginService _rentalService = locator<LoginService>();

  Future<dynamic> loginUser(String bookingId, String token) async {
    String requestJson = json.encode({
      "booking_id" : bookingId,
      "date_format": "m/d/Y",
      "transactionReferenceString": token
    });
    LoginResponseModel response = await _rentalService.getLogin(requestJson);
    if (response != null) {
      return response;
    } else {
      // BotToast.showText(text: "${AppLocalizations.of(context).translate("somethings_went_wrong")} \n${AppLocalizations.of(context).translate("try_again_later")}");
      BotToast.showText(text: "Please try again!");
    }
    return null;
  }
}
