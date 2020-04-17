import 'package:flutter/cupertino.dart';

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Image.asset("start_splash");
  }




}