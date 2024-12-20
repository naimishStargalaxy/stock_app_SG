// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo_project/Data-Model/currency_data.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/preferances.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencySelectionPage extends StatefulWidget {
  const CurrencySelectionPage({super.key});

  @override
  State<CurrencySelectionPage> createState() => _CurrencySelectionPageState();
}

class _CurrencySelectionPageState extends State<CurrencySelectionPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkAppColor.bgColor,
      bottomNavigationBar: Visibility(
        visible: selectedIndex == -1 ? false : true,
        child: GestureDetector(
          onTap: () {
            if (selectedIndex == -1) {
              CommonWidget().toast(
                toastMsg: "Please select one of above",
                toastColor: Colors.red,
              );
            } else {
              CommonWidget().toast(
                toastMsg:
                    "Sucsessfully Select ${currencyData[selectedIndex].currency}",
                toastColor: Colors.green,
              );
              Preference.preference.saveString(
                  "saveCurrency", currencyData[selectedIndex].currency);
              Preference.preference
                  .saveString("fromCurrency", currencyData[selectedIndex].from);
              Preference.preference
                  .saveString("toCurrency", currencyData[selectedIndex].to);
              Get.offAll(PersistenBottomNavBarDemo());
              Preference.preference
                  .saveBool(PrefernceKey.isCurrencyScreenLoaded, true);
            }
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
                  itemCount: currencyData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        width: Get.width,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff212121),
                            border: Border.all(
                                width: 1.5,
                                color: selectedIndex == index
                                    ? DarkAppColor.primaryColor
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(currencyData[index]
                                          .image ==
                                      ""
                                  ? "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg"
                                  : currencyData[index].image),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonWidget().textWidget(
                                    text: currencyData[index].currency,
                                    textColor: DarkAppColor.primaryColor,
                                    textWeight: FontWeight.w500,
                                    textSize: 18.0),
                                CommonWidget().textWidget(
                                    text: currencyData[index].fullname,
                                    textColor: DarkAppColor.primaryColor
                                        .withOpacity(0.5),
                                    textWeight: FontWeight.w400,
                                    textSize: 15.0),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // SizedBox(height: 15),
                // ElevatedButton(
                //     onPressed: () {
                //       if (selectedIndex == -1) {
                //         CommonWidget().toast(
                //           toastMsg: "Please select one of above",
                //           toastColor: Colors.red,
                //         );
                //       } else {
                //         CommonWidget().toast(
                //           toastMsg:
                //               "Sucsessfully Select ${currencyData[selectedIndex].currency}",
                //           toastColor: Colors.green,
                //         );
                //         Preference.preference.saveString("saveCurrency",
                //             currencyData[selectedIndex].currency);
                //         Preference.preference.saveString(
                //             "fromCurrency", currencyData[selectedIndex].from);
                //         Preference.preference.saveString(
                //             "toCurrency", currencyData[selectedIndex].to);
                //         Get.offAll(PersistenBottomNavBarDemo());
                //         Preference.preference.saveBool(
                //             PrefernceKey.isCurrencyScreenLoaded, true);
                //       }
                //     },
                //     child: CommonWidget().textWidget(text: "Done")),
                // SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
