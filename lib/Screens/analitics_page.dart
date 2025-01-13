// ignore_for_file: unnecessary_string_interpolations, use_super_parameters, prefer_const_constructors_in_immutables, avoid_print, non_constant_identifier_names, prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_final_fields, unused_field, deprecated_member_use

import 'package:demo_project/Controllers/forex_data_controller.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnaliticsPage extends StatefulWidget {
  AnaliticsPage({Key? key}) : super(key: key);

  @override
  AnaliticsPageState createState() => AnaliticsPageState();
}

class AnaliticsPageState extends State<AnaliticsPage> {
  ForexDataController _forexDataController = Get.put(ForexDataController());
  String saveCurrency = "";

  DataGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      saveCurrency = pref.getString("saveCurrency") ?? "";
      print(saveCurrency);
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
          backgroundColor: DarkAppColor.bgColor,
          surfaceTintColor: Colors.transparent,
          title: CommonWidget().textWidget(
            text: "${saveCurrency} Analytics",
            textColor: DarkAppColor.primaryColor,
            textSize: 22.0,
            textWeight: FontWeight.w500,
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: Get.height * 0.82,
              child: Obx(() {
                if (_forexDataController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (_forexDataController.chartData.isEmpty) {
                  return Center(child: Text("No Data Available"));
                }

                return SfCartesianChart(
                  plotAreaBorderColor: Colors.transparent,
                  plotAreaBackgroundColor: DarkAppColor.bgColor,
                  borderColor: DarkAppColor.bgColor,
                  // trackballBehavior: _trackballBehavior,
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePinching: true,
                    zoomMode: ZoomMode.x,
                    enablePanning: true,
                    maximumZoomLevel: 0.3,
                  ),
                  series: [
                    CandleSeries<Map<String, dynamic>, DateTime>(
                      dataSource: _forexDataController.chartData,
                      xValueMapper: (data, _) =>
                          DateTime.fromMillisecondsSinceEpoch(
                              data["timestamp"] * 1000),
                      lowValueMapper: (data, _) => data["low"],
                      highValueMapper: (data, _) => data["high"],
                      openValueMapper: (data, _) => data["open"],
                      closeValueMapper: (data, _) => data["close"],
                    ),
                  ],
                  primaryXAxis: DateTimeAxis(
                      intervalType: DateTimeIntervalType.minutes,
                      borderColor: DarkAppColor.bgColor,
                      axisLine:
                          AxisLine(width: 1, color: DarkAppColor.softgreyColor),
                      majorGridLines: MajorGridLines(width: 0)),
                  primaryYAxis: NumericAxis(
                    interval: 1,
                    numberFormat: NumberFormat.compact(),
                    majorGridLines: MajorGridLines(
                        width: 0.5,
                        color: DarkAppColor.softgreyColor.withOpacity(.7)),
                    axisLine:
                        AxisLine(width: 1, color: DarkAppColor.softgreyColor),
                    opposedPosition: true,
                    // plotBands: [
                    // PlotBand(
                    //   // start: _homeController.valuesData[2]["values"][6],
                    //   // end: _homeController.valuesData[2]["values"][3],
                    //   shouldRenderAboveSeries: true,
                    //   borderColor: Colors.red.withOpacity(.5),
                    //   color: Colors.red.withOpacity(0.2),
                    //   borderWidth: 2,
                    //   text: "Stop 0.0098 (0.98%) 95.8, Ammount 750",
                    //   verticalTextAlignment: TextAnchor.start,
                    //   horizontalTextAlignment: TextAnchor.middle,
                    //   verticalTextPadding: "30",
                    //   textStyle: TextStyle(
                    //       backgroundColor: Colors.red,
                    //       color: DarkAppColor.bgColor,
                    //       fontWeight: FontWeight.w700),
                    // ),
                    // PlotBand(
                    //   // start: _homeController.valuesData[2]["values"][3],
                    //   // end: _homeController.valuesData[2]["values"][3],
                    //   shouldRenderAboveSeries: true,
                    //   color: Colors.transparent,
                    //   text:
                    //       "Closed P&L 0.01437, Qty: 26012, \n Risk/Reward Ratio: 3.46",
                    //   verticalTextAlignment: TextAnchor.middle,
                    //   horizontalTextAlignment: TextAnchor.middle,
                    //   textStyle: TextStyle(
                    //       backgroundColor: Colors.green,
                    //       color: DarkAppColor.bgColor,
                    //       fontWeight: FontWeight.w700),
                    //   borderWidth: 2,
                    // ),
                    // PlotBand(
                    //   // start: _homeController.valuesData[2]["values"][0],
                    //   // end: _homeController.valuesData[2]["values"][3],
                    //   shouldRenderAboveSeries: true,
                    //   borderColor: Colors.green.withOpacity(.5),
                    //   color: Colors.green.withOpacity(.2),
                    //   text: "Target: 0.03314 (3.34%) 331.4, Ammount: 1864.82",
                    //   verticalTextAlignment: TextAnchor.end,
                    //   horizontalTextAlignment: TextAnchor.middle,
                    //   verticalTextPadding: "30",
                    //   textStyle: TextStyle(
                    //       backgroundColor: Colors.green,
                    //       color: DarkAppColor.bgColor,
                    //       fontWeight: FontWeight.w700),
                    //   borderWidth: 2,
                    // )
                    // ],
                    borderColor: DarkAppColor.bgColor,
                  ),
                );
              }),

              // child: SfCartesianChart(
              //   plotAreaBackgroundColor: DarkAppColor.bgColor,
              //   borderColor: DarkAppColor.bgColor,
              //   trackballBehavior: _trackballBehavior,
              //   zoomPanBehavior: ZoomPanBehavior(
              //     enablePinching: true,
              //     zoomMode: ZoomMode.x,
              //     enablePanning: true,
              //     maximumZoomLevel: 0.3,
              //   ),
              //   series: <CandleSeries>[
              //     CandleSeries<ChartSampleData, DateTime>(
              //       dataSource: _chartData,
              //       enableSolidCandles: true,
              //       name: '$saveCurrency',
              //       xValueMapper: (ChartSampleData sales, _) => sales.x,
              //       lowValueMapper: (ChartSampleData sales, _) => sales.low,
              //       highValueMapper: (ChartSampleData sales, _) => sales.high,
              //       openValueMapper: (ChartSampleData sales, _) => sales.open,
              //       closeValueMapper: (ChartSampleData sales, _) => sales.close,
              //     ),
              //   ],
              //   plotAreaBorderColor: Colors.transparent,
              //   primaryXAxis: DateTimeAxis(
              //       interval: 1,
              //       autoScrollingMode: AutoScrollingMode.start,
              //       axisLine:
              //           AxisLine(width: 1, color: DarkAppColor.softgreyColor),
              //       dateFormat: DateFormat.MMM(),
              //       initialVisibleMinimum: DateTime(2016, 08, 15),
              //       borderColor: DarkAppColor.bgColor,
              //       majorGridLines: MajorGridLines(width: 0)),
              //   primaryYAxis: NumericAxis(
              //     minimum: _homeController.valuesData[2]["values"][0],
              //     maximum: _homeController.valuesData[2]["values"][6] + 1,
              //     interval: 1,
              //     numberFormat: NumberFormat.compact(),
              //     majorGridLines: MajorGridLines(
              //         width: 0.5,
              //         color: DarkAppColor.softgreyColor.withOpacity(.7)),
              //     axisLine:
              //         AxisLine(width: 1, color: DarkAppColor.softgreyColor),
              //     opposedPosition: true,
              //     plotBands: [
              //       PlotBand(
              //         start: _homeController.valuesData[2]["values"][6],
              //         end: _homeController.valuesData[2]["values"][3],
              //         shouldRenderAboveSeries: true,
              //         borderColor: Colors.red.withOpacity(.5),
              //         color: Colors.red.withOpacity(0.2),
              //         borderWidth: 2,
              //         text: "Stop 0.0098 (0.98%) 95.8, Ammount 750",
              //         verticalTextAlignment: TextAnchor.start,
              //         horizontalTextAlignment: TextAnchor.middle,
              //         verticalTextPadding: "30",
              //         textStyle: TextStyle(
              //             backgroundColor: Colors.red,
              //             color: DarkAppColor.bgColor,
              //             fontWeight: FontWeight.w700),
              //       ),
              //       PlotBand(
              //         start: _homeController.valuesData[2]["values"][3],
              //         end: _homeController.valuesData[2]["values"][3],
              //         shouldRenderAboveSeries: true,
              //         color: Colors.transparent,
              //         text:
              //             "Closed P&L 0.01437, Qty: 26012, \n Risk/Reward Ratio: 3.46",
              //         verticalTextAlignment: TextAnchor.middle,
              //         horizontalTextAlignment: TextAnchor.middle,
              //         textStyle: TextStyle(
              //             backgroundColor: Colors.green,
              //             color: DarkAppColor.bgColor,
              //             fontWeight: FontWeight.w700),
              //         borderWidth: 2,
              //       ),
              //       PlotBand(
              //         start: _homeController.valuesData[2]["values"][0],
              //         end: _homeController.valuesData[2]["values"][3],
              //         shouldRenderAboveSeries: true,
              //         borderColor: Colors.green.withOpacity(.5),
              //         color: Colors.green.withOpacity(.2),
              //         text: "Target: 0.03314 (3.34%) 331.4, Ammount: 1864.82",
              //         verticalTextAlignment: TextAnchor.end,
              //         horizontalTextAlignment: TextAnchor.middle,
              //         verticalTextPadding: "30",
              //         textStyle: TextStyle(
              //             backgroundColor: Colors.green,
              //             color: DarkAppColor.bgColor,
              //             fontWeight: FontWeight.w700),
              //         borderWidth: 2,
              //       )
              //     ],
              //     borderColor: DarkAppColor.bgColor,
              //   ),
              // ),
            ),
          ],
        ));
  }
}
