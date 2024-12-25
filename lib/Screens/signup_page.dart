// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_field, prefer_final_fields, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations

import 'package:demo_project/Controllers/auth_controller.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupPage extends StatelessWidget {
  AuthController _authController = Get.put(AuthController());

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
                controller: _authController.namecontroller,
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
                  _authController.countryCode.value = number.dialCode!;
                  _authController.final_number.value =
                      "${number.dialCode!} ${_authController.phonecontroller.text}";
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
                  leadingPadding: 0,
                  useBottomSheetSafeArea: true,
                ),
                initialValue: PhoneNumber(isoCode: 'IN'),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.white),
                textFieldController: _authController.phonecontroller,
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
                controller: _authController.emailcontroller,
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
              () => Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: DarkAppColor.softgreyColor,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  style: TextStyle(color: DarkAppColor.primaryColor),
                  textAlignVertical: TextAlignVertical(y: 0),
                  controller: _authController.passcontroller,
                  obscureText: _authController.obsecure.value,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: DarkAppColor.primaryColor,
                      ),
                      suffixIcon: IconButton(
                        icon: _authController.obsecure.value
                            ? Icon(Icons.remove_red_eye_outlined)
                            : Icon(Icons.remove_red_eye),
                        onPressed: () {
                          _authController.obsecure.value =
                              !_authController.obsecure.value;
                        },
                      ),
                      hintText: "Enter Password",
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
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
            Obx(
              () => _authController.isLoader.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                              color: DarkAppColor.primaryColor, width: 2)),
                      onPressed: () {
                        if (_authController.emailcontroller.text.isEmpty ||
                            _authController.passcontroller.text.isEmpty ||
                            _authController.phonecontroller.text.isEmpty ||
                            _authController.namecontroller.text.isEmpty) {
                          CommonWidget().toast(
                              toastMsg: "Please Add Data",
                              toastColor: Colors.red);
                        } else {
                          _authController.userRegister();
                        }
                      },
                      child: CommonWidget().textWidget(
                        text: "Save",
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
