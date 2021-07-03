import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:omnirio/app_config.dart/app_config.dart';
import 'package:omnirio/core/services/api.dart';
import 'package:omnirio/core/services/service.dart';
import 'package:omnirio/ui/screens/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator(WebServiceData webServiceConfig) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => Api(
      webServiceConfig.mainApiUrl,
      webServiceConfig.mainApiKey,
      webServiceConfig.updateApiUrl,
      webServiceConfig.updateApiKey,
      webServiceConfig.hotelApiUrl,
      webServiceConfig.hotelApiKey));
      locator.registerLazySingleton(() => Connectivity());

  locator.registerFactory(() => LoginService());
  locator.registerFactory(() => LoginScreen());
}