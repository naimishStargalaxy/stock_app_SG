// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

import 'dart:convert';

class LiveStockDataModel {
  MetaData metaData;
  Map<String, TimeSeriesFx5Min> timeSeriesFx5Min;

  LiveStockDataModel({
    required this.metaData,
    required this.timeSeriesFx5Min,
  });

  factory LiveStockDataModel.fromRawJson(String str) =>
      LiveStockDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LiveStockDataModel.fromJson(Map<String, dynamic> json) =>
      LiveStockDataModel(
        metaData: MetaData.fromJson(json["Meta Data"]),
        timeSeriesFx5Min: Map.from(json["Time Series FX (5min)"]).map((k, v) =>
            MapEntry<String, TimeSeriesFx5Min>(
                k, TimeSeriesFx5Min.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "Meta Data": metaData.toJson(),
        "Time Series FX (5min)": Map.from(timeSeriesFx5Min)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class MetaData {
  String the1Information;
  String the2FromSymbol;
  String the3ToSymbol;
  DateTime the4LastRefreshed;
  String the5Interval;
  String the6OutputSize;
  String the7TimeZone;

  MetaData({
    required this.the1Information,
    required this.the2FromSymbol,
    required this.the3ToSymbol,
    required this.the4LastRefreshed,
    required this.the5Interval,
    required this.the6OutputSize,
    required this.the7TimeZone,
  });

  factory MetaData.fromRawJson(String str) =>
      MetaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        the1Information: json["1. Information"],
        the2FromSymbol: json["2. From Symbol"],
        the3ToSymbol: json["3. To Symbol"],
        the4LastRefreshed: DateTime.parse(json["4. Last Refreshed"]),
        the5Interval: json["5. Interval"],
        the6OutputSize: json["6. Output Size"],
        the7TimeZone: json["7. Time Zone"],
      );

  Map<String, dynamic> toJson() => {
        "1. Information": the1Information,
        "2. From Symbol": the2FromSymbol,
        "3. To Symbol": the3ToSymbol,
        "4. Last Refreshed": the4LastRefreshed.toIso8601String(),
        "5. Interval": the5Interval,
        "6. Output Size": the6OutputSize,
        "7. Time Zone": the7TimeZone,
      };
}

class TimeSeriesFx5Min {
  String the1Open;
  String the2High;
  String the3Low;
  String the4Close;

  TimeSeriesFx5Min({
    required this.the1Open,
    required this.the2High,
    required this.the3Low,
    required this.the4Close,
  });

  factory TimeSeriesFx5Min.fromRawJson(String str) =>
      TimeSeriesFx5Min.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeSeriesFx5Min.fromJson(Map<String, dynamic> json) =>
      TimeSeriesFx5Min(
        the1Open: json["1. open"],
        the2High: json["2. high"],
        the3Low: json["3. low"],
        the4Close: json["4. close"],
      );

  Map<String, dynamic> toJson() => {
        "1. open": the1Open,
        "2. high": the2High,
        "3. low": the3Low,
        "4. close": the4Close,
      };
}

// ===================== Symbol Data Model ====================

class SymbolDataModel {
  String? description;
  String? displaySymbol;
  String? symbol;

  SymbolDataModel({this.description, this.displaySymbol, this.symbol});

  SymbolDataModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    displaySymbol = json['displaySymbol'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['displaySymbol'] = this.displaySymbol;
    data['symbol'] = this.symbol;
    return data;
  }
}
