// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:demo_project/Helper/utility.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  //////// light theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightAppColor.bgColor,
    scaffoldBackgroundColor: LightAppColor.bgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: LightAppColor.bgColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>(
          (states) => DarkAppColor.bgColor),
    ),
  );

//////////////////////////////////////////////

  //////// dark theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkAppColor.bgColor,
    scaffoldBackgroundColor: DarkAppColor.bgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkAppColor.bgColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>(
          (states) => DarkAppColor.bgColor),
    ),
  );

  // colors
  static Color activeColor = Color(0xffffffff);
  static Color activeThumbColor = Color(0xff000000);
}
