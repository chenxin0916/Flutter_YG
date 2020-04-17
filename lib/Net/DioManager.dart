import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterapp/Net/ErrorResponse.dart';
import 'package:flutterapp/Net/Url.dart';

class DioManager {
  static final DioManager _dioManager = DioManager._internal();
  factory DioManager() => _dioManager;

  final BaseOptions _options = BaseOptions(
      baseUrl: Url.BASE_URL,
      responseType: ResponseType.json,
      headers: {"deviceType": "app"},
      receiveDataWhenStatusError: false,
      connectTimeout: 30000,
      receiveTimeout: 30000
  );

  Dio _dio;

  DioManager._internal(){
    _dio = Dio(_options);
  }

  init(token) {
    if(_dio != null) {
      _dio.options.headers["token"] = token;
    }
  }

  Future request<T>({
      String method,
      String url,
     Map<String, dynamic> params,
      Function(dynamic) onSuccess,
      Function(ErrorResponse) onError}) async {
       Response response = await _dio.request(url,
        queryParameters: params, options: Options(method: method));

    if (response == null) {
      ErrorResponse(-1, "服务器错误");
      return;
    }

    if (response.statusCode != 200) {
      ErrorResponse(response.statusCode, "服务器错误");
      return;
    }

    Map<String,dynamic> responseData =  response.data;
    if (responseData["isSuccess"]) {
      onSuccess(responseData["data"]);
    } else {
      onError(ErrorResponse(responseData["errorCode"], responseData["resultMsg"]));
    }
  }
}
