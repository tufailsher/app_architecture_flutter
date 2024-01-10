import 'package:custody_rx/app/app_routes.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static Future<dynamic> navigateToWithReplacement(routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static Future<dynamic> navigateToWithClearStack(routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }

  static Future<dynamic> popToLogin() {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.login,
      (Route<dynamic> route) => false,
    );
  }

  static Future<dynamic> popToDashboard() {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.dashboardScreen,
      (Route<dynamic> route) => false,
    );
  }

  static void goBack() {
    // Navigator.of(context).pop();
    return navigatorKey.currentState!.pop();
  }
}
