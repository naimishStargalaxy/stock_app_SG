// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, non_ant_identifier_names, avoid_print, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, sort_child_properties_last, use_key_in_widget_constructors, must_be_immutable, deprecated_member_use

import 'dart:math';
import 'package:demo_project/Controllers/home_controller.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/all_currency_page.dart';
import 'package:demo_project/Screens/chart_page.dart';
import 'package:demo_project/Screens/setting_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: DarkAppColor.bgColor,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: DarkAppColor.bgColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidget().textWidget(
                text: _homeController.userName.value,
                textColor: DarkAppColor.primaryColor,
                textSize: 20.0,
                textWeight: FontWeight.w500,
              ),
              CommonWidget().textWidget(
                text: "Welcome to ForEX",
                textColor: DarkAppColor.primaryColor.withOpacity(.5),
                textSize: 16.0,
                textWeight: FontWeight.w400,
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(SettingPage());
                },
                icon: Icon(
                  Icons.settings,
                  color: DarkAppColor.primaryColor,
                  size: 30,
                )),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                child: CommonWidget().textWidget(
                  text:
                      _homeController.userName.value.split("").first.toString(),
                  textSize: 20.0,
                  textWeight: FontWeight.w600,
                ),
                backgroundColor:
                    Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                        .withOpacity(.8),
              ),
            ),
          ],
        ),
        body: _homeController.isLoader.value == true
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.cover,
                )),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Get.width * 0.75,
                              decoration: BoxDecoration(
                                  color: DarkAppColor.softgreyColor
                                      .withOpacity(.4),
                                  border: Border.all(
                                      color: DarkAppColor.primaryColor
                                          .withOpacity(.7)),
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextFormField(
                                // onChanged: _homeController.searchfilter,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: DarkAppColor.primaryColor,
                                    ),
                                    hintText: "Search"),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                              color: DarkAppColor.primaryColor,
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidget().textWidget(
                              text: "Majors",
                              textColor: DarkAppColor.primaryColor,
                              textSize: 18.0,
                              textWeight: FontWeight.w700,
                            ),
                            // CommonWidget().textWidget(
                            //   text: "View All",
                            //   textColor: DarkAppColor.primaryColor,
                            //   textSize: 12.0,
                            //   textWeight: FontWeight.w500,
                            // ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 145,
                          child: ListView.builder(
                            itemCount: _homeController
                                    .forexRates["quote"]?.length.bitLength ??
                                0,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final key = _homeController
                                  .forexRates["quote"].keys
                                  .elementAt(index);
                              final value =
                                  _homeController.forexRates["quote"][key];
                              return GestureDetector(
                                onTap: () {
                                  CommonWidget()
                                      .toast(toastMsg: "Tap On ${index + 1}");
                                },
                                child: currencyPairWidget(
                                    name: "USD${key}",
                                    value: value.toString(),
                                    boxBorder: index.isEven
                                        ? DarkAppColor.greenColor
                                        : DarkAppColor.redColor),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidget().textWidget(
                              text: "Currency Pairs",
                              textColor: DarkAppColor.primaryColor,
                              textSize: 18.0,
                              textWeight: FontWeight.w700,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(AllCurrencyPage());
                              },
                              child: CommonWidget().textWidget(
                                text: "View All",
                                textColor: DarkAppColor.primaryColor,
                                textSize: 12.0,
                                textWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Obx(() {
                          if (_homeController.forexRates.isEmpty) {
                            return Center(child: Text("No Data Available"));
                          }

                          return GridView.builder(
                            itemCount: _homeController
                                    .forexRates["quote"]?.length.bitLength ??
                                0,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              final key = _homeController
                                  .forexRates["quote"].keys
                                  .elementAt(index);
                              final value =
                                  _homeController.forexRates["quote"][key];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(ChartPage(),
                                      arguments: _homeController
                                          .forexRates["quote"].keys
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 70,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                          );
                        }),

                        SizedBox(height: 20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     CommonWidget().textWidget(
                        //       text: "Currencies Indices",
                        //       textColor: DarkAppColor.primaryColor,
                        //       textSize: 18.0,
                        //       textWeight: FontWeight.w700,
                        //     ),
                        //     CommonWidget().textWidget(
                        //       text: "View All",
                        //       textColor: DarkAppColor.primaryColor,
                        //       textSize: 12.0,
                        //       textWeight: FontWeight.w500,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 10),
                        // ListView.builder(
                        //   itemCount: 4,
                        //   shrinkWrap: true,
                        //   padding: EdgeInsets.zero,
                        //   physics: ClampingScrollPhysics(),
                        //   itemBuilder: (context, index) {
                        //     return GestureDetector(
                        //       onTap: () {
                        //         CommonWidget().toast(toastMsg: "Tap On ${index + 1}");
                        //       },
                        //       child: currencyIndices(
                        //         textColor: index.isEven
                        //             ? DarkAppColor.greenColor
                        //             : DarkAppColor.redColor,
                        //       ),
                        //     );
                        //   },
                        // ),
                        // SizedBox(height: 10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     CommonWidget().textWidget(
                        //       text: "Top Stories",
                        //       textColor: DarkAppColor.primaryColor,
                        //       textSize: 18.0,
                        //       textWeight: FontWeight.w700,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 10),
                        // ListView.builder(
                        //   itemCount: 4,
                        //   shrinkWrap: true,
                        //   padding: EdgeInsets.zero,
                        //   physics: ClampingScrollPhysics(),
                        //   itemBuilder: (context, index) {
                        //     return GestureDetector(
                        //         onTap: () {
                        //           CommonWidget()
                        //               .toast(toastMsg: "Tap On ${index + 1}");
                        //         },
                        //         child: topStoriesWidget());
                        //   },
                        // ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidget().textWidget(
                              text: "Latest News",
                              textColor: DarkAppColor.primaryColor,
                              textSize: 18.0,
                              textWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () {
                            if (_homeController.calendarEvents.isEmpty) {
                              return Center(
                                  child: Text("No events available."));
                            }
                            return ListView.builder(
                              itemCount: _homeController.newsList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final reversevents =
                                    _homeController.newsList.reversed.toList();
                                final event = reversevents[index];
                                return GestureDetector(
                                    onTap: () {
                                      Get.defaultDialog(
                                          contentPadding: EdgeInsets.all(5),
                                          title: event["title"],
                                          titleStyle: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                          middleText: event["snippet"],
                                          middleTextStyle: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700));
                                    },
                                    child: newsWidget(
                                      image: event["photo_url"] ?? "",
                                      date: event["published_datetime_utc"],
                                      title: event["title"],
                                      snippet: event["snippet"],
                                    ));
                              },
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidget().textWidget(
                              text: "Economic Calender",
                              textColor: DarkAppColor.primaryColor,
                              textSize: 18.0,
                              textWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                            height: 130,
                            child: Obx(() {
                              if (_homeController.calendarEvents.isEmpty) {
                                return Center(
                                    child: Text("No events available."));
                              }

                              return ListView.builder(
                                itemCount:
                                    _homeController.calendarEvents.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                physics: ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final reversevents = _homeController
                                      .calendarEvents.reversed
                                      .toList();
                                  final event = reversevents[index];
                                  return economicCelenderWidget(
                                    country: event['Currency'],
                                    title: event['Name'],
                                    date: event['Date'],
                                    forecast: event['Forecast'] ?? "--",
                                    actual: event['Actual'] ?? "--",
                                    previous: event['Previous'] ?? "--",
                                  );
                                },
                              );
                            })),
                        SizedBox(height: 80)
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget currencyPairWidget({name, value, boxBorder}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: DarkAppColor.softgreyColor.withOpacity(.4),
          border: Border.all(color: boxBorder),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // CircleAvatar(
              //   radius: 15,
              //   backgroundImage: NetworkImage(
              //       "https://media.istockphoto.com/id/495646866/photo/usa-and-india-flag.jpg?s=612x612&w=0&k=20&c=Ycv-B4rSv3u9dx5a1QaMs9SaL6Z9-9I-8wO1OWd53tY="),
              // ),
              CircleAvatar(
                radius: 30,
                backgroundColor: DarkAppColor.bgColor,
                child: CommonWidget().textWidget(
                  text: name,
                  textSize: 10.0,
                  textColor: DarkAppColor.primaryColor,
                  textWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10),
              CommonWidget().textWidget(
                text: name,
                textSize: 16.0,
                textColor: DarkAppColor.primaryColor,
                textWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(height: 8),
          CommonWidget().textWidget(
            text: value,
            textSize: 18.0,
            textColor: DarkAppColor.primaryColor,
            textWeight: FontWeight.w600,
          ),
          // SizedBox(height: 8),
          // CommonWidget().textWidget(
          //   text: "+0.24%",
          //   textColor: DarkAppColor.greenColor,
          //   textSize: 15.0,
          //   textWeight: FontWeight.w500,
          // ),
          // SizedBox(height: 8),
          // SizedBox(
          //   height: 50,
          //   width: 100,
          //   child: LineChart(
          //     LineChartData(
          //       lineBarsData: [
          //         LineChartBarData(
          //           aboveBarData: BarAreaData(show: true),
          //           spots: [
          //             FlSpot(0, 3),
          //             FlSpot(1, 1),
          //             FlSpot(2, 4),
          //             FlSpot(3, 2),
          //           ],
          //           isCurved: true,
          //           dotData: FlDotData(show: true),
          //         ),
          //       ],
          //       titlesData: FlTitlesData(show: false),
          //       borderData: FlBorderData(show: true),
          //       gridData: FlGridData(show: true),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 8),
          // CommonWidget().textWidget(
          //   text: "1 Day",
          //   textColor: DarkAppColor.primaryColor,
          //   textSize: 15.0,
          //   textWeight: FontWeight.w500,
          // ),
        ],
      ),
    );
  }

  Widget majorWidget({
    currency,
    boxBorder,
    currencyName,
  }) {
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
            backgroundColor: DarkAppColor.bgColor,
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

  Widget currencyIndices({textColor}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: DarkAppColor.softgreyColor),
          color: Color(0xff212121),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/1424386528/vector/us-dollar-green-vector-icon-flat-design-business-symbol.jpg?s=612x612&w=0&k=20&c=VFsWQ6-GHkJO-tNoTr-DHyNR_vwmuwTsLKzXqeVp5V4="),
              ),
              SizedBox(width: 10),
              CommonWidget().textWidget(
                text: "EUR/USD",
                textSize: 16.0,
                textColor: DarkAppColor.primaryColor,
                textWeight: FontWeight.w500,
              ),
              SizedBox(width: 10),
              SizedBox(
                height: 40,
                width: 100,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        aboveBarData: BarAreaData(show: true),
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(1, 1),
                          FlSpot(2, 4),
                          FlSpot(3, 2),
                        ],
                        isCurved: true,
                        dotData: FlDotData(show: true),
                      ),
                    ],
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: true),
                    gridData: FlGridData(show: true),
                  ),
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidget().textWidget(
                    text: "1.06574",
                    textSize: 16.0,
                    textColor: DarkAppColor.primaryColor,
                    textWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 5),
                  CommonWidget().textWidget(
                    text: "^ 0.17%",
                    textSize: 16.0,
                    textColor: DarkAppColor.greenColor,
                    textWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          CommonWidget().textWidget(
            text: "Euro Vs US Dollar",
            textSize: 14.0,
            textColor: DarkAppColor.primaryColor.withOpacity(0.5),
            textWeight: FontWeight.w500,
          ),
        ],
      ),
      // child: Row(
      //   children: [

      //     SizedBox(width: 15),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         CommonWidget().textWidget(
      //           text: "U.S. Dollar",
      //           textSize: 16.0,
      //           textColor: DarkAppColor.primaryColor,
      //           textWeight: FontWeight.w700,
      //         ),
      //         CommonWidget().textWidget(
      //           text: "DXY",
      //           textSize: 13.0,
      //           textColor: DarkAppColor.primaryColor.withOpacity(.5),
      //           textWeight: FontWeight.w500,
      //         ),
      //       ],
      //     ),
      //     Spacer(),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         CommonWidget().textWidget(
      //           text: "83.5214 USD",
      //           textColor: DarkAppColor.primaryColor.withOpacity(.5),
      //           textSize: 15.0,
      //           textWeight: FontWeight.w500,
      //         ),
      //         CommonWidget().textWidget(
      //           text: "0.24%",
      //           textSize: 15.0,
      //           textColor: textColor,
      //           textWeight: FontWeight.w500,
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }

  Widget topStoriesWidget() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: DarkAppColor.softgreyColor.withOpacity(.4),
          border: Border.all(color: DarkAppColor.primaryColor.withOpacity(.7)),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: DarkAppColor.primaryColor,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://wallpapers.com/images/featured/stock-market-pd5zksxr07t7a4xu.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.55,
                child: CommonWidget().textWidget(
                  text:
                      "EUR/USD: Euro on the Brink of Hitting Strongest Level in 14 Months. Big Resistance Ahead",
                  textmaxLine: 2,
                  textColor: Colors.white,
                  textoverFlow: TextOverflow.ellipsis,
                  textSize: 15.0,
                  textWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonWidget().textWidget(
                    text: "USD/INR",
                    textColor: Colors.white54,
                    textSize: 12.0,
                    textWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 10),
                  CommonWidget().textWidget(
                    text: "^ 0.17%",
                    textColor: DarkAppColor.greenColor,
                    textSize: 14.0,
                    textWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 10),
                  CommonWidget().textWidget(
                    text: "11 Minutes Ago",
                    textColor: Colors.white54,
                    textSize: 12.0,
                    textWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget newsWidget({image, date, title, snippet}) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: DarkAppColor.primaryColor.withOpacity(.7)),
          color: DarkAppColor.softgreyColor.withOpacity(.4),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(image),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * 0.7,
                    child: CommonWidget().textWidget(
                      text: title,
                      textmaxLine: 2,
                      textoverFlow: TextOverflow.ellipsis,
                      textColor: DarkAppColor.primaryColor,
                      textSize: 13.0,
                      textWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  CommonWidget().textWidget(
                    text: date.toString().split("T").first,
                    textColor: DarkAppColor.primaryColor.withOpacity(0.5),
                    textSize: 10.0,
                    textWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            child: CommonWidget().textWidget(
              text: snippet,
              textmaxLine: 2,
              textoverFlow: TextOverflow.ellipsis,
              textColor: DarkAppColor.primaryColor.withOpacity(.5),
              textSize: 15.0,
              textWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget economicCelenderWidget(
      {country, date, title, actual, forecast, previous}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: DarkAppColor.primaryColor.withOpacity(.7)),
          color: DarkAppColor.softgreyColor.withOpacity(.4),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: CommonWidget().textWidget(text: country, textSize: 12.0),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidget().textWidget(
                    text: title,
                    textSize: 16.0,
                    textColor: DarkAppColor.primaryColor,
                    textWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 5),
                  CommonWidget().textWidget(
                    text: "Date: ${date.toString().split(" ").first}",
                    textSize: 10.0,
                    textColor: DarkAppColor.primaryColor,
                    textWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: Get.width * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CommonWidget().textWidget(
                      text: "Actual",
                      textSize: 14.0,
                      textColor: DarkAppColor.primaryColor,
                      textWeight: FontWeight.w500,
                    ),
                    CommonWidget().textWidget(
                      text: actual.toString(),
                      textSize: 16.0,
                      textColor: DarkAppColor.primaryColor.withOpacity(.5),
                      textWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CommonWidget().textWidget(
                      text: "Forecast",
                      textSize: 14.0,
                      textColor: DarkAppColor.primaryColor,
                      textWeight: FontWeight.w500,
                    ),
                    CommonWidget().textWidget(
                      text: forecast.toString(),
                      textSize: 16.0,
                      textColor: DarkAppColor.primaryColor.withOpacity(.5),
                      textWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CommonWidget().textWidget(
                      text: "Previous",
                      textSize: 14.0,
                      textColor: DarkAppColor.primaryColor,
                      textWeight: FontWeight.w500,
                    ),
                    CommonWidget().textWidget(
                      text: previous.toString(),
                      textSize: 16.0,
                      textColor: DarkAppColor.primaryColor.withOpacity(.5),
                      textWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
