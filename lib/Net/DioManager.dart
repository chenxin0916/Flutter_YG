import 'package:dio/dio.dart';
import 'package:flutterapp/Net/BaseResponse.dart';
import 'package:flutterapp/Net/ErrorResponse.dart';
import 'package:flutterapp/Net/Url.dart';

class DioManager {
  static final DioManager _dioManager = DioManager._internal();
  factory DioManager() => _dioManager;

  Dio _dio;

  DioManager._internal(){
    _dio = Dio();
  }

  init(token) {
    if(_dio == null) _dio = Dio();
    Map<String, dynamic> header = {
      "deviceType": "app",
      "Content-Type": "application/json",
      "token": token
    };
    BaseOptions options = BaseOptions(
        baseUrl: Url.BASE_URL,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        headers: header,
        connectTimeout: 30000,
        receiveTimeout: 30000);
    _dio.options = options;
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
    print(response.data);
//    if (baseResponse.isSuccess) {
//      onSuccess(baseResponse.data);
//    } else {
//      onError(ErrorResponse(baseResponse.errorCode, baseResponse.resultMsg));
//    }
  }
}
