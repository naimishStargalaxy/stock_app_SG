// ignore_for_file: unnecessary_overrides, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:demo_project/Data-Model/forex_data_model.dart';
import 'package:demo_project/Helper/apis.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForexDataController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List tradeList = [
    "EURUSD",
    "GBPUSD",
    "USDJPY",
    "USDCHF",
    "USDCAD",
    "XAUUSD",
    "XAGUSD",
    "USOIL",
    "US30",
    "BTCUSD"
  ];

  @override
  void onInit() {
    tradeData();
    // livesStockDataApi();
    super.onInit();
  }

  tradeData() async {
    final response = await http.get(
      Uri.parse(BASE_URL.baseUrl + API_END_POINTS.trade),
    );
    print(response.body);
    if (response.statusCode == 200) {
      // tradeList = tradeList.;
      log(response.body);
      return tradeList;
    } else {
      print(response.statusCode);
      throw Exception('Not Found');
    }
  }
}
