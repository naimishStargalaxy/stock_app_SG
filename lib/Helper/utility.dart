// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class ApiUrl {
  static String BaseUrl =
      "https://www.alphavantage.co/query?function=FX_INTRADAY&from_symbol=EUR&to_symbol=USD&interval=5min&apikey=${Token.token}";
  // static String BaseUrl =
  //     "https://finnhub.io/api/v1/forex/exchange?token=${Token.token}";
}

class Token {
  // alpha vantage
  static String token = "YLC778037QZOBFHS";
  // finhub
  // static String token = "crufdt9r01qi6bkavtfgcrufdt9r01qi6bkavtg0";
}

class DarkAppColor {
  static Color bgColor = Color(0xff000000);
  static Color primaryColor = Color(0xfff2f2f2);
  static Color softgreyColor = Color(0xff3A3A47);
  static Color greenColor = Color(0xff5ECCA3);
  static Color redColor = Color(0xffFF7070);
}

class LightAppColor {
  static Color bgColor = Color(0xffffffff);
  static Color primaryColor = Color(0xff12121c);
  static Color softgreyColor = Color(0xff3A3A47);
  static Color greenColor = Color(0xff5ECCA3);
  static Color redColor = Color(0xffFF7070);
}

class PrefernceKey {
  static String isIntroductionScreenLoaded = "isIntroductionScreenLoaded";
  static String isCurrencyScreenLoaded = "isCurrencyScreenLoaded";
}
