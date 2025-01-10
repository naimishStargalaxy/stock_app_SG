// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:async';

import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/bottom_nav_bar.dart';
import 'package:demo_project/Screens/intro_screen.dart';
import 'package:demo_project/Screens/signup_page.dart';
import 'package:flutter/material.dart';

import '../Helper/preferances.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () async {
      var isIntroduction = await Preference.preference
          .getBool(key: PrefernceKey.isIntroductionScreenLoaded, defVal: false);
      var isCurrencyLoaded = await Preference.preference
          .getBool(key: PrefernceKey.isCurrencyScreenLoaded, defVal: false);
      if (isIntroduction == false && isCurrencyLoaded == false) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => IntroScreens()));
      } else if (isIntroduction == true && isCurrencyLoaded == false) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => SignupPage()));
      } else if (isIntroduction == true && isCurrencyLoaded == true) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => PersistenBottomNavBarDemo()));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkAppColor.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/fx.png",
              width: 70,
            ),
          )
        ],
      ),
    );
  }
}
