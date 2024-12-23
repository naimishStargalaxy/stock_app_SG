// ignore_for_file: unnecessary_string_interpolations, use_super_parameters, prefer_const_constructors_in_immutables, avoid_print, non_constant_identifier_names, prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_final_fields, unused_field

import 'package:demo_project/Controllers/forex_data_controller.dart';
import 'package:demo_project/Data-Model/mock_data.dart';
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
  late List<ChartSampleData> _chartData;
  late TrackballBehavior _trackballBehavior;
  String saveCurrency = "";

  ForexDataController _forexDataController = Get.put(ForexDataController());

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
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
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
              child: SfCartesianChart(
                plotAreaBackgroundColor: DarkAppColor.bgColor,
                borderColor: DarkAppColor.bgColor,
                trackballBehavior: _trackballBehavior,
                zoomPanBehavior: ZoomPanBehavior(
                  enablePinching: true,
                  zoomMode: ZoomMode.x,
                  enablePanning: true,
                  maximumZoomLevel: 0.3,
                ),
                series: <CandleSeries>[
                  CandleSeries<ChartSampleData, DateTime>(
                    dataSource: _chartData,
                    enableSolidCandles: true,
                    name: '$saveCurrency',
                    xValueMapper: (ChartSampleData sales, _) => sales.x,
                    lowValueMapper: (ChartSampleData sales, _) => sales.low,
                    highValueMapper: (ChartSampleData sales, _) => sales.high,
                    openValueMapper: (ChartSampleData sales, _) => sales.open,
                    closeValueMapper: (ChartSampleData sales, _) => sales.close,
                  ),
                ],
                plotAreaBorderColor: Colors.transparent,
                primaryXAxis: DateTimeAxis(
                    interval: 1,
                    autoScrollingMode: AutoScrollingMode.start,
                    axisLine:
                        AxisLine(width: 1, color: DarkAppColor.softgreyColor),
                    dateFormat: DateFormat.MMM(),
                    initialVisibleMinimum: DateTime(2016, 08, 15),
                    borderColor: DarkAppColor.bgColor,
                    majorGridLines: MajorGridLines(width: 0)),
                primaryYAxis: NumericAxis(
                  minimum: 85,
                  interval: 5,
                  numberFormat: NumberFormat.compact(),
                  majorGridLines: MajorGridLines(
                      width: 0.5,
                      color: DarkAppColor.softgreyColor.withOpacity(.7)),
                  axisLine:
                      AxisLine(width: 1, color: DarkAppColor.softgreyColor),
                  opposedPosition: true,
                  plotBands: [
                    PlotBand(
                      start: 101,
                      end: 101,
                      shouldRenderAboveSeries: false,
                      borderColor: Colors.blueAccent,
                      text: "101.0",
                      verticalTextAlignment: TextAnchor.end,
                      horizontalTextAlignment: TextAnchor.end,
                      horizontalTextPadding: "-15",
                      verticalTextPadding: "5",
                      textStyle: TextStyle(color: DarkAppColor.primaryColor),
                      borderWidth: 2,
                    )
                  ],
                  borderColor: DarkAppColor.bgColor,
                ),
              ),
            ),
            Container(
              height: 30,
              width: Get.width * 0.4,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: DarkAppColor.bgColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: DarkAppColor.softgreyColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonWidget().textWidget(
                      text: "1M",
                      textWeight: FontWeight.w700,
                      textColor: DarkAppColor.primaryColor),
                  Container(
                    width: 1,
                    height: 25,
                    color: DarkAppColor.softgreyColor,
                  ),
                  CommonWidget().textWidget(
                      text: "6M",
                      textWeight: FontWeight.w700,
                      textColor: DarkAppColor.primaryColor),
                  Container(
                    width: 1,
                    height: 25,
                    color: DarkAppColor.softgreyColor,
                  ),
                  CommonWidget().textWidget(
                      text: "1Y",
                      textWeight: FontWeight.w700,
                      textColor: DarkAppColor.primaryColor),
                  Container(
                    width: 1,
                    height: 25,
                    color: DarkAppColor.softgreyColor,
                  ),
                  CommonWidget().textWidget(
                      text: "ALL",
                      textWeight: FontWeight.w700,
                      textColor: DarkAppColor.primaryColor),
                ],
              ),
            ),
          ],
        ));
  }
}
