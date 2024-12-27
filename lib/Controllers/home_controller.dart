// ignore_for_file: unnecessary_overrides, avoid_print

import 'dart:convert';

import 'package:demo_project/Data-Model/currency_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxBool isLoader = false.obs;
  RxString userId = "".obs;
  RxString userName = "".obs;
  RxString userMobileNumber = "".obs;
  dynamic store;
  List valuesData = [];

  @override
  void onInit() {
    isLoader.value = true;
    getUserInfo();
    loadJsonData();
    isLoader.value = false;
    super.onInit();
  }

  Future<void> loadJsonData() async {
    final String response =
        await rootBundle.loadString('assets/forex_data.json');
    final data = json.decode(response);
    print(data[0]);
    valuesData = data;

    print(valuesData);
  }

  getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId.value = pref.getString("userId") ?? "";
    userName.value = pref.getString("userName") ?? "";
    userMobileNumber.value = pref.getString("userMobileNumber") ?? "";
    print(userId.toString());
    print(userName.toString());
    print(userMobileNumber.toString());
  }

  void searchfilter(String quary) {
    var suggetion = currencyData.where((data) {
      final datatile = data.currency.toLowerCase();
      final input = quary.toLowerCase();
      return datatile.contains(input);
    }).toList();

    if (searchController.text.isEmpty) {
      print('ppppppppppp');

      currencyData = store;
    } else {
      currencyData = suggetion;
    }
  }
}
