// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, use_key_in_widget_constructors, must_be_immutable

import 'package:demo_project/Controllers/forgot_password_controller.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordController _forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkAppColor.bgColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            CommonWidget().textWidget(
              text: "Forgot Password",
              textSize: 21.0,
              textColor: DarkAppColor.primaryColor,
              textWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: DarkAppColor.softgreyColor,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: TextFormField(
                style: TextStyle(color: DarkAppColor.primaryColor),
                controller: _forgotPasswordController.emailcontroller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    hintText: "Enter Email",
                    hintStyle: TextStyle(
                      color: DarkAppColor.primaryColor,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => _forgotPasswordController.isLoader.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                              color: DarkAppColor.primaryColor, width: 2)),
                      onPressed: () {
                        if (_forgotPasswordController
                            .emailcontroller.text.isEmpty) {
                          CommonWidget().toast(
                              toastMsg: "Please Add Data",
                              toastColor: Colors.red);
                        } else {
                          _forgotPasswordController.forgotPassword();
                        }
                      },
                      child: CommonWidget().textWidget(
                        text: "Send OTP",
                        textColor: DarkAppColor.primaryColor,
                        textWeight: FontWeight.w600,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
