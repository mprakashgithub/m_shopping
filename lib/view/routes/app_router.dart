import 'package:flutter/material.dart';

import '../app_data/app_strings.dart';
import '../screens/login.dart';
import '../screens/products.dart';
import '../screens/splash.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  late Widget pageResult;
  switch (settings.name) {
    case AppStrings.routeToSplash:
      pageResult = const Splash();
      break;
    case AppStrings.routeToLogin:
      pageResult = const Login();
      break;
    case AppStrings.routeToProducts:
      pageResult = const Products();
      break;
  }
  debugPrint(pageResult.toString());
  return _generateMaterialRoute(pageResult);
}

Route<dynamic> _generateMaterialRoute(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
