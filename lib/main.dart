import 'package:flutter/material.dart';
import 'package:omnirio/app_config.dart/app_config.dart';
import 'package:omnirio/locator.dart';
import 'package:omnirio/myapp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  WebServiceData webServiceData = WebServiceData();

  await setupLocator(webServiceData);
  var configuredApp = AppConfig(
    child: MyApp(webServiceConfig: webServiceData),
  );
  runApp(configuredApp);
}