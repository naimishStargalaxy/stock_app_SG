// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class ResponseModel {
  String? message;

  ResponseModel({this.message});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;

    return data;
  }
}
