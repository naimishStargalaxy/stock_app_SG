// ignore_for_file: unnecessary_overrides, avoid_print, invalid_use_of_protected_member

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final ApiService _apiService = ApiService();
  RxBool isLoader = false.obs;
  RxString userId = "".obs;
  RxString userName = "".obs;
  RxString userMobileNumber = "".obs;
  var forexRates = {}.obs;
  var calendarEvents = <dynamic>[].obs;
  var newsList = <dynamic>[].obs;
  List valuesData = [];
  var chartData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    isLoader.value = true;
    getUserInfo();
    fetchChartDatas();
    loadJsonData();
    fetchForexRates();
    fetchEconomicNews();
    fetchEconomicCalendar();
    isLoader.value = false;
    super.onInit();
  }

  Future<List<Map<String, dynamic>>> fetchChartData() async {
    final url = Uri.parse("http://frxceltrd.com:4004/json-long-exceldata");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          return data
              .map<Map<String, dynamic>>((item) => item as Map<String, dynamic>)
              .toList();
        } else {
          throw Exception("Unexpected response format");
        }
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred: $e");
    }
  }

  void fetchChartDatas() async {
    isLoader(true);
    try {
      var data = await fetchChartData();
      // Transform API data to suitable format
      chartData.value = data.map((item) {
        return {
          "date": DateTime.parse(item["date"]),
          "value": item["value"],
        };
      }).toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoader(false);
    }
  }

  Future<void> loadJsonData() async {
    final String response =
        await rootBundle.loadString('assets/forex_data.json');
    final data = json.decode(response);
    print(data[0]);
    valuesData = data;

    print(valuesData);
  }

  getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId.value = pref.getString("userId") ?? "";
    userName.value = pref.getString("userName") ?? "";
    userMobileNumber.value = pref.getString("userMobileNumber") ?? "";
  }

  Future<List<dynamic>> fetchEconomicCalendar() async {
    final response = await http.get(
        Uri.parse(
            "https://www.jblanked.com/news/api/forex-factory/calendar/today/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer mtLT6ohJ.LsEBNi1caaWmz7x4WfGxuvmiB1DDvmOm"
        });

    if (response.statusCode == 200) {
      calendarEvents.value = json.decode(response.body);
      print(calendarEvents.value);
      return calendarEvents.value;
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  Future<List<dynamic>> fetchEconomicNews() async {
    final response = await http.get(
        Uri.parse(
            "https://real-time-news-data.p.rapidapi.com/search?query=forex&limit=10&time_published=anytime&country=US&lang=en"),
        headers: {
          "Content-Type": "application/json",
          "x-rapidapi-key": "013c82bbccmsh5b7970fe9800812p18944ajsn2b736d3c19f6"
        });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      newsList.value = data["data"];
      return newsList.value;
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  void fetchForexRates() async {
    isLoader(true);
    try {
      var data = await _apiService.getForexRates();
      forexRates.value = data;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoader(false);
    }
  }
}

class ApiService {
  Future<Map<String, dynamic>> getForexRates() async {
    final url = Uri.parse(
        "https://finnhub.io/api/v1/forex/rates?base=USD&token=ct22mr1r01qoprggttbgct22mr1r01qoprggttc0");

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
