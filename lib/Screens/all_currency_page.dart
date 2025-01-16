// ignore_for_file: prefer_const_constructors, prefer_final_fields, deprecated_member_use, use_key_in_widget_constructors, must_be_immutable

import 'package:demo_project/Controllers/home_controller.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/chart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCurrencyPage extends StatelessWidget {
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkAppColor.bgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: DarkAppColor.bgColor,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: CommonWidget().textWidget(
          text: "All Currency Pairs",
          textColor: DarkAppColor.primaryColor,
          textSize: 20.0,
          textWeight: FontWeight.w500,
        ),
      ),
      body: Obx(() {
        if (_homeController.forexRates.isEmpty) {
          return Center(child: Text("No Data Available"));
        }

        return GridView.builder(
          itemCount: _homeController.forexRates["quote"]?.length ?? 0,
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final key =
                _homeController.forexRates["quote"].keys.elementAt(index);
            final value = _homeController.forexRates["quote"][key];
            return GestureDetector(
              onTap: () {
                Get.to(ChartPage(),
                    arguments: _homeController.forexRates["quote"].keys
                        .elementAt(index));
              },
              child: majorWidget(
                  currencyName: "USD${key}",
                  currency: value.toString(),
                  boxBorder: index.isOdd
                      ? DarkAppColor.greenColor
                      : DarkAppColor.redColor),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 70,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
        );
      }),
    );
  }

  Widget majorWidget({currency, currencyName, boxBorder}) {
    return Container(
      decoration: BoxDecoration(
          color: DarkAppColor.softgreyColor.withOpacity(.4),
          border: Border.all(color: boxBorder),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 25,
            child: CommonWidget().textWidget(
              text: currencyName,
              textSize: 8.0,
              textColor: DarkAppColor.primaryColor,
              textWeight: FontWeight.w500,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonWidget().textWidget(
                text: currencyName,
                textSize: 16.0,
                textColor: DarkAppColor.primaryColor,
                textWeight: FontWeight.w700,
              ),
              CommonWidget().textWidget(
                text: currency,
                textSize: 13.0,
                textColor: DarkAppColor.primaryColor.withOpacity(.5),
                textWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
