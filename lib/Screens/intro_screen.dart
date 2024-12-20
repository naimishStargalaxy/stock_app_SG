// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field

import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/signIn_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Helper/preferances.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  PageController _pageController = PageController();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DarkAppColor.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.8,
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  selectedIndex = value;
                },
                children: [
                  pageViewWidget(
                    context: context,
                    boxText: "Trade With Cryptos, Currency, Stocks Or Forex.",
                    image: "assets/1.png",
                  ),
                  pageViewWidget(
                    context: context,
                    boxText: "Auto copy Best Traders, And Doing Growth",
                    image: "assets/2.png",
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: JumpingDotEffect(
                  spacing: 8.0,
                  dotWidth: 15.0,
                  dotHeight: 15.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1.5,
                  dotColor: Colors.grey,
                  activeDotColor: DarkAppColor.primaryColor),
            ),
          ],
        ));
  }

  Widget pageViewWidget({context, boxText, image}) {
    return Container(
      decoration: BoxDecoration(
        color: DarkAppColor.bgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: Get.height * 0.4,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.contain)),
          ),
          SizedBox(height: 25),
          CommonWidget().textWidget(
              text: boxText,
              textColor: DarkAppColor.primaryColor,
              textSize: 24.0,
              textAlign: TextAlign.center,
              textWeight: FontWeight.w600),
          GestureDetector(
            onTap: () {
              if (_pageController.page == 1) {
                Get.off(SigninPage());
                Preference.preference
                    .saveBool(PrefernceKey.isIntroductionScreenLoaded, true);
              } else {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              }
            },
            child: Container(
              height: 50,
              width: Get.width * 0.4,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: DarkAppColor.primaryColor,
                  )),
              child: Center(
                child: CommonWidget().textWidget(
                    text: "Next",
                    textColor: DarkAppColor.primaryColor,
                    textSize: 22.0,
                    textAlign: TextAlign.center,
                    textWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
