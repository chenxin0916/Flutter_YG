import 'package:flutter/cupertino.dart';

class LivePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LivePageState();
  }
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("直播"),alignment: Alignment.center);
  }
}