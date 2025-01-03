// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, use_key_in_widget_constructors, must_be_immutable, sort_child_properties_last, deprecated_member_use

import 'dart:math';

import 'package:demo_project/Controllers/profile_controller.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfileController _profileconntroller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: DarkAppColor.bgColor,
        appBar: AppBar(
          backgroundColor: DarkAppColor.bgColor,
          surfaceTintColor: Colors.transparent,
          title: CommonWidget().textWidget(
            text: "Profile",
            textColor: DarkAppColor.primaryColor,
            textSize: 22.0,
            textWeight: FontWeight.w500,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.to(() => EditProfile());
              },
              child: CommonWidget().textWidget(
                text: "Edit Profile",
                textColor: DarkAppColor.primaryColor,
                textSize: 16.0,
                textWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 35,
                        child: CommonWidget().textWidget(
                          text:
                              _profileconntroller.userName.value[0].toString(),
                          textSize: 25.0,
                          textWeight: FontWeight.w600,
                        ),
                        backgroundColor: Color(
                                (Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                            .withOpacity(.8),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWidget().textWidget(
                          text: _profileconntroller.userName.value,
                          textColor: DarkAppColor.primaryColor,
                          textSize: 18.0,
                          textWeight: FontWeight.w500,
                        ),
                        CommonWidget().textWidget(
                          text:
                              "Mobile No: ${_profileconntroller.userMobileNumber.value}",
                          textColor: DarkAppColor.primaryColor.withOpacity(.5),
                          textSize: 15.0,
                          textWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: DarkAppColor.primaryColor.withOpacity(.4)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.card_giftcard_rounded,
                        size: 25,
                        color: DarkAppColor.primaryColor,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidget().textWidget(
                            text: "Referral Code",
                            textColor: DarkAppColor.primaryColor,
                            textSize: 16.0,
                            textWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: Get.width * 0.75,
                            child: CommonWidget().textWidget(
                              text:
                                  "Share Your Friends and get 2% of free stocks",
                              textColor:
                                  DarkAppColor.primaryColor.withOpacity(0.7),
                              textmaxLine: 2,
                              textoverFlow: TextOverflow.ellipsis,
                              textSize: 12.0,
                              textWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: DarkAppColor.primaryColor.withOpacity(.4)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.wallet,
                        size: 25,
                        color: DarkAppColor.primaryColor,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidget().textWidget(
                            text: "Crypto Wallet",
                            textColor: DarkAppColor.primaryColor,
                            textSize: 16.0,
                            textWeight: FontWeight.w500,
                          ),
                          Row(
                            children: [
                              CommonWidget().textWidget(
                                text: "Balance :",
                                textColor:
                                    DarkAppColor.primaryColor.withOpacity(0.7),
                                textSize: 12.0,
                                textWeight: FontWeight.w400,
                              ),
                              SizedBox(width: 5),
                              CommonWidget().textWidget(
                                text: "0.00 USD",
                                textColor: DarkAppColor.primaryColor,
                                textSize: 14.0,
                                textWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 15),
                // Divider(
                //   color: DarkAppColor.primaryColor,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
