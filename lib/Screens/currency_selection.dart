// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, use_key_in_widget_constructors, must_be_immutable

import 'package:demo_project/Controllers/forex_data_controller.dart';
import 'package:demo_project/Controllers/home_controller.dart';
import 'package:demo_project/Controllers/profile_controller.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/preferances.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencySelectionPage extends StatelessWidget {
  ForexDataController _forexDataController = Get.put(ForexDataController());
  HomeController _homeController = Get.put(HomeController());
  ProfileController _profileconntroller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: DarkAppColor.bgColor,
        bottomNavigationBar: Visibility(
          visible:
              _forexDataController.selectedIndex.value == -1 ? false : true,
          child: GestureDetector(
            onTap: () {
              if (_forexDataController.selectedIndex.value == -1) {
                CommonWidget().toast(
                  toastMsg: "Please select one of above",
                  toastColor: Colors.red,
                );
              } else {
                CommonWidget().toast(
                  toastMsg:
                      "Sucsessfully Select ${_forexDataController.tradeList[_forexDataController.selectedIndex.value]}",
                  toastColor: Colors.green,
                );
              }

              Preference.preference.saveString(
                  "saveCurrency",
                  _forexDataController
                      .tradeList[_forexDataController.selectedIndex.value]);
              Get.offAll(PersistenBottomNavBarDemo());
              Preference.preference
                  .saveBool(PrefernceKey.isCurrencyScreenLoaded, true);
            },
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: DarkAppColor.softgreyColor,
                ),
                child: Center(
                    child: CommonWidget().textWidget(
                  text: "Done",
                  textColor: DarkAppColor.primaryColor,
                  textSize: 20.0,
                  textWeight: FontWeight.w700,
                ))),
          ),
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
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  CommonWidget().textWidget(
                    text: "Currency Selection",
                    textSize: 22.0,
                    textColor: DarkAppColor.primaryColor,
                    textWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: _forexDataController.tradeList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _forexDataController.selectedIndex.value = index;
                        },
                        child: Container(
                          width: Get.width,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xff212121),
                              border: Border.all(
                                  width: 1.5,
                                  color: _forexDataController
                                              .selectedIndex.value ==
                                          index
                                      ? DarkAppColor.primaryColor
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(15)),
                          child: CommonWidget().textWidget(
                              text: _forexDataController.tradeList[index],
                              textColor: DarkAppColor.primaryColor,
                              textWeight: FontWeight.w500,
                              textSize: 18.0),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
