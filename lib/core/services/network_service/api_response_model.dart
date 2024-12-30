import 'dart:convert';

class ApiResponseModel {
  var data;
  int? count;
  String? message;
  bool? isSuccess;
  List<String>? errorMessages;
  ApiResponseModel({this.count, this.data, this.isSuccess, this.errorMessages});

  ApiResponseModel.fromJson(Map<String,dynamic> jsonObject) {
    data = jsonObject['data'];
    message = jsonObject['message'];
    count = jsonObject['count'] ?? 0;
    isSuccess = jsonObject['isSuccess'];
    if (jsonObject['errors'] != null) {
      errorMessages = <String>[];
      jsonObject['errors'].forEach((dynamic v) {
        errorMessages!.add(v);
      });
    }
  }
}
