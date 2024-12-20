// ignore_for_file: prefer_const_constructors

import 'package:demo_project/Screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Helper/themedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashPage(),
    );
  }
}
