

class BaseResponse {
  int errorCode;
  bool isSuccess;
  String resultMsg;
  dynamic data;

  BaseResponse({this.errorCode, this.isSuccess, this.resultMsg, this.data});

//  factory BaseResponse.fromJson(jsonStr) {
//    return BaseResponse(
//      isSuccess: jsonStr["isSuccess"],
//      resultMsg: jsonStr["resultMsg"],
//      data: json.decode(jsonStr["data"])
//    );
//  }
}