
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Net/DioManager.dart';
import 'package:flutterapp/Net/Url.dart';
import 'package:flutterapp/page/MainPage.dart';

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;

  @override
  void initState() {
    var _startTime = DateTime.now().millisecondsSinceEpoch;
    DioManager().request(
        method: "get",
        url: Url.VISITOR_LOGIN,
        params: {},
        onSuccess: (data){
          DioManager().init(data["token"]);
          var countDownTime = DateTime.now().millisecondsSinceEpoch - _startTime;
          if (countDownTime < 2000) {
            _timer = new Timer(new Duration(microseconds: countDownTime), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage() ));
            });
          }
        },
        onError: (error){
          print(error.errorCode);
        }
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer =null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child:Image.asset("image/start_splash.png",fit: BoxFit.cover));
  }

}