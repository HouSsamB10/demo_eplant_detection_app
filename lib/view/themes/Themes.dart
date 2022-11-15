import 'package:flutter/material.dart';

import '../ColorConstants.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.light,
    appBarTheme:
        AppBarTheme(backgroundColor: Colors.grey.shade50, elevation: 0),
    textTheme: TextTheme(
      headline1: const TextStyle(
          fontSize: 48, color: Colors.black, fontWeight: FontWeight.bold),
      headline2: const TextStyle(
          fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
      headline3: const TextStyle(
          fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
      headline4: const TextStyle(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
      headline5: const TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
      headline6: const TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      subtitle1: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5),
      subtitle2: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      bodyText2: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      button: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      caption: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 12,
          fontWeight: FontWeight.w400),
      overline: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorConstants.gray900,
    appBarTheme:
        AppBarTheme(backgroundColor: ColorConstants.gray900, elevation: 0),
    bottomAppBarColor: ColorConstants.gray800,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 48,
          color: Colors.grey.shade50,
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 40,
          color: Colors.grey.shade50,
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontSize: 32,
          color: Colors.grey.shade50,
          fontWeight: FontWeight.bold),
      headline4: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 28,
          fontWeight: FontWeight.w600),
      headline5: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 24,
          fontWeight: FontWeight.w500),
      headline6: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 18,
          fontWeight: FontWeight.w500),
      subtitle1: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5),
      subtitle2: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      bodyText2: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      button: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      caption: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 12,
          fontWeight: FontWeight.w500),
      overline: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 10,
          fontWeight: FontWeight.w400),
    ),
  );
}
