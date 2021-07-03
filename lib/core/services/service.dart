
import 'package:dio/dio.dart';
import 'package:omnirio/core/models/response/login_reponse_model.dart';
import 'package:omnirio/core/services/api.dart';
import 'package:omnirio/locator.dart';

class LoginService {
  Api api = locator<Api>();

  Future<LoginResponseModel> getLogin(String requestJson) {
    return api.getLogin(requestJson);
  }
}
