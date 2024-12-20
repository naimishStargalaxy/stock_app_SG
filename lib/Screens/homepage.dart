// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, non_ant_identifier_names, avoid_print, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:demo_project/Data-Model/currency_data.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/setting_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String saveCurrency = "";
  String fromCurrency = "";
  String toCurrency = "";

  DataGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      saveCurrency = pref.getString("saveCurrency") ?? "";
      fromCurrency = pref.getString("fromCurrency") ?? "";
      toCurrency = pref.getString("toCurrency") ?? "";
      print(saveCurrency);
      print(fromCurrency);
      print(toCurrency);
    });
  }

  @override
  void initState() {
    DataGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkAppColor.bgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: DarkAppColor.bgColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidget().textWidget(
              text: "Naimish",
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
              backgroundImage: NetworkImage(
                  "https://www.shutterstock.com/image-vector/man-character-face-avatar-glasses-600nw-542759665.jpg"),
            ),
          ),
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
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                          color: DarkAppColor.softgreyColor.withOpacity(.4),
                          border: Border.all(
                              color: DarkAppColor.primaryColor.withOpacity(.7)),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
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
                      text: "Currency Pairs",
                      textColor: DarkAppColor.primaryColor,
                      textSize: 18.0,
                      textWeight: FontWeight.w700,
                    ),
                    CommonWidget().textWidget(
                      text: "View All",
                      textColor: DarkAppColor.primaryColor,
                      textSize: 12.0,
                      textWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          CommonWidget().toast(toastMsg: "Tap On ${index + 1}");
                        },
                        child: currencyPairWidget(),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget().textWidget(
                      text: "Majors",
                      textColor: DarkAppColor.primaryColor,
                      textSize: 18.0,
                      textWeight: FontWeight.w700,
                    ),
                    CommonWidget().textWidget(
                      text: "View All",
                      textColor: DarkAppColor.primaryColor,
                      textSize: 12.0,
                      textWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                  itemCount: currencyData.length.bitLength,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        CommonWidget().toast(toastMsg: "Tap On ${index + 1}");
                      },
                      child: majorWidget(
                          currency: currencyData[index].currency.toString(),
                          imageSource: NetworkImage(currencyData[index].image ==
                                  ""
                              ? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"
                              : currencyData[index].image.toString()),
                          currencyName:
                              currencyData[index].currencyName.toString(),
                          textColor: index.isEven
                              ? DarkAppColor.redColor
                              : DarkAppColor.greenColor,
                          borderColor: index.isEven
                              ? DarkAppColor.redColor
                              : DarkAppColor.greenColor),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 80,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget().textWidget(
                      text: "Currencies Indices",
                      textColor: DarkAppColor.primaryColor,
                      textSize: 18.0,
                      textWeight: FontWeight.w700,
                    ),
                    CommonWidget().textWidget(
                      text: "View All",
                      textColor: DarkAppColor.primaryColor,
                      textSize: 12.0,
                      textWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        CommonWidget().toast(toastMsg: "Tap On ${index + 1}");
                      },
                      child: currencyIndices(
                        textColor: index.isEven
                            ? DarkAppColor.greenColor
                            : DarkAppColor.redColor,
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget().textWidget(
                      text: "Top Stories",
                      textColor: DarkAppColor.primaryColor,
                      textSize: 18.0,
                      textWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          CommonWidget().toast(toastMsg: "Tap On ${index + 1}");
                        },
                        child: topStoriesWidget());
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget().textWidget(
                      text: "News",
                      textColor: DarkAppColor.primaryColor,
                      textSize: 18.0,
                      textWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          CommonWidget().toast(toastMsg: "Tap On ${index + 1}");
                        },
                        child: newsWidget());
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
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            CommonWidget()
                                .toast(toastMsg: "Tap On ${index + 1}");
                          },
                          child: economicCelenderWidget());
                    },
                  ),
                ),
                SizedBox(height: 80)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget currencyPairWidget() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: DarkAppColor.softgreyColor.withOpacity(.4),
          border: Border.all(color: DarkAppColor.primaryColor.withOpacity(.7)),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/495646866/photo/usa-and-india-flag.jpg?s=612x612&w=0&k=20&c=Ycv-B4rSv3u9dx5a1QaMs9SaL6Z9-9I-8wO1OWd53tY="),
              ),
              SizedBox(width: 10),
              CommonWidget().textWidget(
                text: "USD to INR",
                textSize: 15.0,
                textColor: DarkAppColor.primaryColor,
                textWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 8),
          CommonWidget().textWidget(
            text: "83.2540 INR",
            textSize: 17.0,
            textColor: DarkAppColor.primaryColor,
            textWeight: FontWeight.w500,
          ),
          SizedBox(height: 8),
          CommonWidget().textWidget(
            text: "+0.24%",
            textColor: DarkAppColor.greenColor,
            textSize: 15.0,
            textWeight: FontWeight.w500,
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 50,
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
          SizedBox(height: 8),
          CommonWidget().textWidget(
            text: "1 Day",
            textColor: DarkAppColor.primaryColor,
            textSize: 15.0,
            textWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget majorWidget(
      {currency, currencyName, borderColor, textColor, imageSource}) {
    return Container(
      decoration: BoxDecoration(
          color: DarkAppColor.softgreyColor.withOpacity(.4),
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: imageSource,
          ),
          SizedBox(width: 15),
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
              CommonWidget().textWidget(
                text: "^ 0.59%",
                textColor: textColor,
                textSize: 15.0,
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
            height: 80,
            width: Get.width * 0.2,
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
                width: Get.width * 0.6,
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
                    textSize: 14.0,
                    textWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 10),
                  CommonWidget().textWidget(
                    text: "^ 0.17%",
                    textColor: DarkAppColor.greenColor,
                    textSize: 16.0,
                    textWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 10),
                  CommonWidget().textWidget(
                    text: "11 Minutes Ago",
                    textColor: Colors.white54,
                    textSize: 14.0,
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

  Widget newsWidget() {
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
                radius: 15,
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/495646866/photo/usa-and-india-flag.jpg?s=612x612&w=0&k=20&c=Ycv-B4rSv3u9dx5a1QaMs9SaL6Z9-9I-8wO1OWd53tY="),
              ),
              SizedBox(width: 10),
              CommonWidget().textWidget(
                text: "Sep 20",
                textColor: DarkAppColor.primaryColor,
                textSize: 16.0,
                textWeight: FontWeight.w500,
              ),
              SizedBox(width: 10),
              CommonWidget().textWidget(
                text: "- Dow Jues News",
                textColor: DarkAppColor.primaryColor,
                textSize: 16.0,
                textWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            child: CommonWidget().textWidget(
              text:
                  "EUR/USD: Euro on the Brink of Hitting Strongest Level in 14 Months. Big Resistance Ahead",
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

  Widget economicCelenderWidget() {
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
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/495646866/photo/usa-and-india-flag.jpg?s=612x612&w=0&k=20&c=Ycv-B4rSv3u9dx5a1QaMs9SaL6Z9-9I-8wO1OWd53tY="),
              ),
              SizedBox(width: 10),
              CommonWidget().textWidget(
                text: "Continuing Jobless Claims",
                textSize: 16.0,
                textColor: DarkAppColor.primaryColor,
                textWeight: FontWeight.w500,
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
                      text: "Actuals",
                      textSize: 14.0,
                      textColor: DarkAppColor.primaryColor,
                      textWeight: FontWeight.w500,
                    ),
                    CommonWidget().textWidget(
                      text: "28:15",
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
                      text: "-",
                      textSize: 16.0,
                      textColor: DarkAppColor.primaryColor.withOpacity(.5),
                      textWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CommonWidget().textWidget(
                      text: "Prior",
                      textSize: 14.0,
                      textColor: DarkAppColor.primaryColor,
                      textWeight: FontWeight.w500,
                    ),
                    CommonWidget().textWidget(
                      text: "1,842 K",
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
