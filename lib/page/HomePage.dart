import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Net/DioManager.dart';
import 'package:flutterapp/Net/Url.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _control;
  List<String> _tableList;
  @override
  void initState() {
    _control = TabController(initialIndex: 0,length: 4,vsync: this);
    _tableList = List();

    DioManager().request(method: "get",url: Url.GET_HOME_PAGE_TAG,onSuccess: (data){

//      this.setState((){
////        _tableList.addAll(data[])
//      });
    },onError: (error){});

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("sadsa"));
//    return Column(children: <Widget>[
//      TabBar(
//        isScrollable: false,
//         controller: _control,
//         tabs:_tableList.map((item){
//           return Tab(
//             text: item,
//           );
//         }).toList()
//      ),
//      TabBarView(
//        controller: _control,
//        children: _tableList.map((item) {
//          return Stack(children: <Widget>[
//            Align(alignment:Alignment.topCenter,child: Text(item),),
//          ],);
//        }).toList(),
//      )
//    ],);
  }
}