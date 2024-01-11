import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:busme/views/login_view.dart';
import 'package:busme/views/onboarding_view.dart';
import 'package:busme/views/splash_view.dart';
import 'package:busme/views/home_view.dart';
import 'package:busme/views/main_view.dart';
import 'package:busme/views/register_view.dart';
import 'package:busme/views/forgot_password/forgot_password_view.dart';

const String ROUTE_SPLASH = '/splash';
const String ROUTE_ONBOARDING = '/onboarding';
const String ROUTE_LOGIN = '/login';
const String ROUTE_REGISTER = '/register';
const String ROUTE_MAIN = '/main';
const String ROUTE_FORGOT_PASSWORD = '/forgot_password';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_SPLASH:
        return CupertinoPageRoute(
            builder: (_) => SplashView(), settings: settings);
      case ROUTE_ONBOARDING:
        return CupertinoPageRoute(
            builder: (_) => OnboardingView(), settings: settings);
      case ROUTE_LOGIN:
        return CupertinoPageRoute(
            builder: (_) => LoginView(), settings: settings);
      case ROUTE_REGISTER:
        return CupertinoPageRoute(
            builder: (_) => RegisterView(), settings: settings);
      case ROUTE_FORGOT_PASSWORD:
        return CupertinoPageRoute(
            builder: (_) => ForgotPasswordView(), settings: settings);
      case ROUTE_MAIN:
        return CupertinoPageRoute(
            builder: (_) => MainView(), settings: settings);
      default:
        return CupertinoPageRoute(
          builder: (_) => OnboardingView(),
          settings: settings,
        );
    }
  }
}
