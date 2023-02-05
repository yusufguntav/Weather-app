import 'package:flutter/material.dart';

TextStyle kTextStyle =
    const TextStyle(fontSize: 50, fontWeight: FontWeight.w800);
Color kBackgroundColor = const Color.fromRGBO(29, 33, 54, 1);
ThemeData kThemeData = ThemeData(
  primaryColor: const Color.fromRGBO(29, 33, 54, 100),
  scaffoldBackgroundColor: const Color.fromRGBO(29, 33, 54, 100),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color.fromRGBO(29, 33, 54, 100),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    subtitle1: TextStyle(color: Colors.white),
  ),
);
