import 'package:flutter/material.dart';
import 'package:finance_app/constraints.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFF141414),
    fontFamily: "Muli",
    appBarTheme: AppBarTheme(
        color: Color(0xFF141414),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: kTextColor),
        bodyText2: TextStyle(color: kTextColor)),
    primarySwatch: Colors.blue,
  );
}
