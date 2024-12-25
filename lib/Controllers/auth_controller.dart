// ignore_for_file: prefer_final_fields, unused_field, avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';
import 'package:demo_project/Data-Model/response_model.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Helper/apis.dart';
import '../Helper/preferances.dart';
import '../Screens/currency_selection.dart';

class AuthController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  RxBool isLoader = false.obs;
  RxBool obsecure = false.obs;
  RxString country_name = "".obs;
  RxString final_number = "".obs;
  RxString countryCode = "".obs;
  var message = "";

  Future<http.Response> userRegister() async {
    isLoader.value = true;
    Map data = {
      "email": emailcontroller.text.trim(),
      "password": passcontroller.text.trim(),
      "name": namecontroller.text.trim(),
      "country": "India",
      "countrycode": countryCode.value,
      "mobile_num": final_number.value,
    };

    print(data);

    final response = await http.post(
      Uri.parse(BASE_URL.baseUrl + API_END_POINTS.register),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    print(response.body);
    message = ResponseModel.fromJson(jsonDecode(response.body)).message!;
    if (response.statusCode == 200) {
      print(response.body);
      isLoader.value = false;
      CommonWidget()
          .toast(toastMsg: message, toastColor: LightAppColor.greenColor);
      Preference.preference
          .saveBool(PrefernceKey.isIntroductionScreenLoaded, true);
      Get.offAll(() => CurrencySelectionPage());
    } else {
      isLoader.value = false;
      CommonWidget()
          .toast(toastMsg: message, toastColor: LightAppColor.redColor);
    }
    return response;
  }

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
    message = ResponseModel.fromJson(jsonDecode(response.body)).message!;
    if (response.statusCode == 200) {
      print(response.body);
      isLoader.value = false;
      CommonWidget()
          .toast(toastMsg: message, toastColor: LightAppColor.greenColor);
      Preference.preference
          .saveBool(PrefernceKey.isIntroductionScreenLoaded, true);
      Get.offAll(() => CurrencySelectionPage());
    } else {
      isLoader.value = false;
      CommonWidget()
          .toast(toastMsg: message, toastColor: LightAppColor.redColor);
    }
    return response;
  }
}
