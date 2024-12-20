// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_field, prefer_final_fields

import 'dart:io';

import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/preferances.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/currency_selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();

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
              text: "Login An User",
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
                controller: _emailcontroller,
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
                controller: _passcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: DarkAppColor.primaryColor,
                    ),
                    hintText: "Enter Password",
                    floatingLabelBehavior: FloatingLabelBehavior.auto),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side:
                        BorderSide(color: DarkAppColor.primaryColor, width: 2)),
                onPressed: () {
                  if (_emailcontroller.text.isEmpty ||
                      _passcontroller.text.isEmpty) {
                    CommonWidget().toast(
                        toastMsg: "Please Add Data", toastColor: Colors.red);
                  } else {
                    Preference.preference.saveBool(
                        PrefernceKey.isIntroductionScreenLoaded, true);
                    Get.offAll(() => CurrencySelectionPage());
                  }
                },
                child: CommonWidget().textWidget(
                  text: "Save",
                  textColor: DarkAppColor.primaryColor,
                  textWeight: FontWeight.w600,
                ))
          ],
        ),
      ),
    );
  }
}
