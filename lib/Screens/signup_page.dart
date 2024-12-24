// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_field, prefer_final_fields

import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/preferances.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/currency_selection.dart';
import 'package:demo_project/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();

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
              text: "Register New User",
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
                controller: _namecontroller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    hintText: "Enter Full Name",
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: DarkAppColor.softgreyColor,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                textAlignVertical: TextAlignVertical.top,
                inputDecoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(color: DarkAppColor.primaryColor)),
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  useBottomSheetSafeArea: true,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.white),
                textFieldController: _phonecontroller,
                formatInput: true,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
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
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => SigninPage());
              },
              child: CommonWidget().textWidget(
                text: "Already have an account? LOGIN",
                textColor: DarkAppColor.primaryColor,
                textSize: 12.0,
                textWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side:
                        BorderSide(color: DarkAppColor.primaryColor, width: 2)),
                onPressed: () {
                  if (_emailcontroller.text.isEmpty ||
                      _passcontroller.text.isEmpty ||
                      _namecontroller.text.isEmpty) {
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
