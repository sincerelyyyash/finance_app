import 'package:flutter/widgets.dart';
import 'package:finance_app/screens/sign_in/SignInScreen.dart';
import 'package:finance_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
};
