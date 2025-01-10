// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class CalendarEvent {
  String? name;
  String? currency;
  String? date;
  int? actual;
  int? forecast;
  int? previous;
  String? outcome;
  String? strength;
  String? quality;

  CalendarEvent(
      {this.name,
      this.currency,
      this.date,
      this.actual,
      this.forecast,
      this.previous,
      this.outcome,
      this.strength,
      this.quality});

  CalendarEvent.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    currency = json['Currency'];
    date = json['Date'];
    actual = json['Actual'];
    forecast = json['Forecast'];
    previous = json['Previous'];
    outcome = json['Outcome'];
    strength = json['Strength'];
    quality = json['Quality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Currency'] = this.currency;
    data['Date'] = this.date;
    data['Actual'] = this.actual;
    data['Forecast'] = this.forecast;
    data['Previous'] = this.previous;
    data['Outcome'] = this.outcome;
    data['Strength'] = this.strength;
    data['Quality'] = this.quality;
    return data;
  }
}
