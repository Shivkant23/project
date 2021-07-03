import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:omnirio/core/models/response/login_reponse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String flightSessionRequestId;
  String carSessionRequestId;
  String hotelSessionRequestId;
  String vacationRentalSessionRequestId;
  String activitySessionRequestId;
  String baseUrl;
  String baseApiKey;
  BaseOptions _options;
  Dio _dio;
  String updateApiUrl;
  String hotelApiUrl;
  String hotelApiKey;
  String updateApiKey;
  Api(String apiUrl, apiKey, updateApiUrl, updateApiKey, hotelApiUrl,
      hotelApiKey) {
    this.hotelApiUrl = hotelApiUrl;
    this.hotelApiKey = hotelApiKey;
    this.updateApiUrl = updateApiUrl;
    this.updateApiKey = updateApiKey;
    baseUrl = apiUrl;
    baseApiKey = apiKey;
    _options = new BaseOptions(
      baseUrl: apiUrl,
      connectTimeout: 60000,
      followRedirects: false,
      validateStatus: (status) {
        return status < 500;
      },
      receiveTimeout: 60000,
    );
    _dio = new Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {

      
      return handler.next(options);
    }, onResponse: (response, handler) async {
      _dio.options.headers["request-id"] = " ";
      print("=============RESPONSE==============");
      print(response);
      print("=============RESPONSE==============");
      return handler.next(response); // continue
    }, onError: (DioError e, handler) async {
      print(e);
      return handler.next(e); //continue
    }));
  }

  Future<LoginResponseModel> getLogin(String requestJson) async {
    _options.connectTimeout = 125000;
    try {
      Response response = await _dio.post("/member/login",
          data: requestJson,
          options: Options(headers: {
            "device-token": "",
            "Access-Control-Allow-Origin": "*"
          }));
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        return LoginResponseModel.fromJson(response.data);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
