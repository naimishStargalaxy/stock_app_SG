// ignore_for_file: unnecessary_overrides, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:demo_project/Data-Model/forex_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForexDataController extends GetxController {
  LiveStockDataModel? loadAlldata;

  @override
  void onInit() {
    // livesStockDataApi();
    super.onInit();
  }

  livesStockDataApi() async {
    final response = await http.get(
      Uri.parse(
          "https://alpha-vantage.p.rapidapi.com/query?function=FX_INTRADAY&interval=5min&datatype=json&to_symbol=CHF&from_symbol=USD&outputsize=compact"),
      headers: {
        "x-rapidapi-key": "013c82bbccmsh5b7970fe9800812p18944ajsn2b736d3c19f6"
      },
    );
    if (response.statusCode == 200) {
      loadAlldata = LiveStockDataModel.fromJson(jsonDecode(response.body));
      log(response.body);
      return loadAlldata;
    } else {
      print(response.statusCode);
      throw Exception('Not Found');
    }
  }
}
