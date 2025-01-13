// ignore_for_file: unnecessary_overrides, avoid_print, prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'package:demo_project/Helper/apis.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForexDataController extends GetxController {
  final ForexApiService _apiService = ForexApiService();
  var chartData = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  String symbol = "OANDA:XAU_USD";
  final String resolution = "1";
  RxInt selectedIndex = 0.obs;
  List tradeList = [
    "EUR_USD",
    "GBP_USD",
    "USD_JPY",
    "USD_CHF",
    "USD_CAD",
    "XAU_USD",
    "XAG_USD",
  ];

  @override
  void onInit() {
    // getUserInfo();
    tradeData();
    fetchChartData();
    startAutoRefresh();
    super.onInit();
  }

  // getUserInfo() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   symbol.value = pref.getString("userId") ?? "";
  //   tradeData();
  //   fetchChartData(symbol: symbol.value.toString());
  //   startAutoRefresh();
  // }

  tradeData() async {
    final response = await http.get(
      Uri.parse(BASE_URL.baseUrl + API_END_POINTS.trade),
    );
    print(response.body);
    if (response.statusCode == 200) {
      log(response.body);
      return tradeList;
    } else {
      print(response.statusCode);
      throw Exception('Not Found');
    }
  }

  void fetchChartData() async {
    isLoading(true);
    try {
      var data = await _apiService.getForexCandle(symbol, resolution);

      if (data.containsKey("s") && data["s"] == "ok") {
        List<Map<String, dynamic>> parsedData = [];
        for (int i = 0; i < data["t"].length; i++) {
          parsedData.add({
            "timestamp": data["t"][i],
            "open": data["o"][i],
            "close": data["c"][i],
            "high": data["h"][i],
            "low": data["l"][i],
          });
        }
        chartData.value = parsedData;
      } else {
        throw Exception("Invalid API response");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void startAutoRefresh() {
    ever(isLoading, (isLoading) {
      if (!isLoading) {
        Future.delayed(Duration(seconds: 30), fetchChartData);
      }
    });
  }
}

class ForexApiService {
  final String _baseUrl = "https://finnhub.io/api/v1";
  final String _apiKey = "ct22mr1r01qoprggttbgct22mr1r01qoprggttc0";

  Future<Map<String, dynamic>> getForexCandle(
      String symbol, String resolution) async {
    final url = Uri.parse(
        "$_baseUrl/forex/candle?symbol=$symbol&resolution=$resolution&token=$_apiKey");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred: $e");
    }
  }
}
