// ignore_for_file: prefer_final_fields, unused_field, avoid_print, prefer_const_constructors

import 'dart:convert';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Helper/apis.dart';
import '../Helper/preferances.dart';
import '../Screens/currency_selection.dart';

class LoginController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  RxBool isLoader = false.obs;
  RxBool obsecure = false.obs;

  Future<http.Response> userLogin() async {
    isLoader.value = true;
    Map data = {
      "email": emailcontroller.text.trim(),
      "password": passcontroller.text.trim(),
    };

    print(data);

    final response = await http.post(
      Uri.parse(BASE_URL.baseUrl + API_END_POINTS.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      isLoader.value = false;
      Preference.preference
          .saveBool(PrefernceKey.isIntroductionScreenLoaded, true);
      Get.offAll(() => CurrencySelectionPage());
    } else {
      isLoader.value = false;
      CommonWidget().toast(
          toastMsg: "Something went wrong", toastColor: LightAppColor.redColor);
    }
    return response;
  }
}
