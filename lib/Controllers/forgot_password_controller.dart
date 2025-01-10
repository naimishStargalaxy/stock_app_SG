// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:demo_project/Helper/preferances.dart';
import 'package:demo_project/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Data-Model/response_model.dart';
import '../Helper/apis.dart';
import '../Helper/common_widget.dart';
import '../Helper/utility.dart';
import '../Screens/reset_password_page.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController newPasscontroller = TextEditingController();
  RxBool isLoader = false.obs;
  var message = "";
  RxBool isvisible = false.obs;

  Future<http.Response> forgotPassword() async {
    isLoader.value = true;

    Map data = {
      "email": emailcontroller.text.trim(),
    };

    final response = await http.post(
      Uri.parse(BASE_URL.baseUrl + API_END_POINTS.otpRequest),
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
      Preference.preference
          .saveBool(PrefernceKey.isIntroductionScreenLoaded, true);
      Preference.preference.saveString("email", emailcontroller.text.trim());
      CommonWidget().toast(
          toastMsg: "${message} to ${emailcontroller.text.trim()}",
          toastColor: LightAppColor.greenColor);
      Get.to(() => ResetPasswordPage());
    } else {
      isLoader.value = false;
      CommonWidget()
          .toast(toastMsg: message, toastColor: LightAppColor.redColor);
    }
    return response;
  }

  Future<http.Response> otpVerify({useremail}) async {
    isLoader.value = true;

    Map data = {
      "email": useremail,
      "otp": otpcontroller.text.trim(),
    };

    final response = await http.post(
      Uri.parse(BASE_URL.baseUrl + API_END_POINTS.otpVerify),
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
      isvisible.value = true;
    } else {
      isLoader.value = false;
      CommonWidget()
          .toast(toastMsg: message, toastColor: LightAppColor.redColor);
    }
    return response;
  }

  Future<http.Response> resetpassword({useremail}) async {
    isLoader.value = true;

    Map data = {
      "email": useremail,
      "newPassword": newPasscontroller.text.trim(),
    };

    final response = await http.post(
      Uri.parse(BASE_URL.baseUrl + API_END_POINTS.resetPassword),
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
      Get.offAll(SigninPage());
    } else {
      isLoader.value = false;
      CommonWidget()
          .toast(toastMsg: message, toastColor: LightAppColor.redColor);
    }
    return response;
  }
}
