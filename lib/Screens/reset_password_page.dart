// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_final_fields

import 'package:demo_project/Controllers/forgot_password_controller.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/utility.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  ForgotPasswordController _forgotPasswordController =
      Get.put(ForgotPasswordController());
  String email = "";

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    email = pref.getString("email") ?? "";
    print(email);
    setState(() {});
  }

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
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              _forgotPasswordController.isvisible.value == false
                  ? CommonWidget().textWidget(
                      text: "OTP Verify",
                      textSize: 21.0,
                      textColor: DarkAppColor.primaryColor,
                      textWeight: FontWeight.w500,
                    )
                  : CommonWidget().textWidget(
                      text: "Reset Password",
                      textSize: 21.0,
                      textColor: DarkAppColor.primaryColor,
                      textWeight: FontWeight.w500,
                    ),
              SizedBox(
                height: 50,
              ),
              _forgotPasswordController.isvisible.value == false
                  ? Container(
                      width: Get.width,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: DarkAppColor.softgreyColor,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        style: TextStyle(color: DarkAppColor.primaryColor),
                        controller: _forgotPasswordController.otpcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            border: InputBorder.none,
                            hintText: "Enter OTP",
                            hintStyle: TextStyle(
                              color: DarkAppColor.primaryColor,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto),
                      ),
                    )
                  : Container(
                      width: Get.width,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: DarkAppColor.softgreyColor,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        style: TextStyle(color: DarkAppColor.primaryColor),
                        controller: _forgotPasswordController.newPasscontroller,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            border: InputBorder.none,
                            hintText: "Enter New Password",
                            hintStyle: TextStyle(
                              color: DarkAppColor.primaryColor,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto),
                      ),
                    ),
              SizedBox(
                height: 50,
              ),
              _forgotPasswordController.isvisible.value == false
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                              color: DarkAppColor.primaryColor, width: 2)),
                      onPressed: () {
                        if (_forgotPasswordController
                            .otpcontroller.text.isEmpty) {
                          CommonWidget().toast(
                              toastMsg: "Please Add OTP",
                              toastColor: Colors.red);
                        } else {
                          _forgotPasswordController.otpVerify(
                              useremail: email.toString());
                        }
                      },
                      child: CommonWidget().textWidget(
                        text: "OTP Verify",
                        textColor: DarkAppColor.primaryColor,
                        textWeight: FontWeight.w600,
                      ))
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                              color: DarkAppColor.primaryColor, width: 2)),
                      onPressed: () {
                        if (_forgotPasswordController
                            .newPasscontroller.text.isEmpty) {
                          CommonWidget().toast(
                              toastMsg: "Please Add OTP",
                              toastColor: Colors.red);
                        } else {
                          _forgotPasswordController.resetpassword(
                              useremail: email.toString());
                        }
                      },
                      child: CommonWidget().textWidget(
                        text: "Save Password",
                        textColor: DarkAppColor.primaryColor,
                        textWeight: FontWeight.w600,
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
