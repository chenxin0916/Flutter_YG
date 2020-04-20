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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  TabController _control;
  List<dynamic> _tableList;
  @override
  void initState() {
    _tableList = List();
    _control = TabController(initialIndex: 0,length: _tableList.length,vsync: this);
    super.initState();
  }

  getTabData(){
    DioManager().request(method: "get",url: Url.GET_HOME_PAGE_TAG,onSuccess: (data){
      setState(() {
        _tableList.addAll(data);
        _control =  TabController(initialIndex: 0,length: _tableList.length,vsync: this);
      });
    },onError: (error){
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    getTabData();
    return Column(children: <Widget>[
      TabBar(
        isScrollable: false,
         controller: _control,
         tabs:_tableList.map((item){
           return Tab(
             text: item["name"],
           );
         }).toList()
      ),
//      TabBarView(
//        controller: _control,
//        children: _tableList.map((item) {
//          return Stack(children: <Widget>[
//            Align(alignment:Alignment.topCenter,child: Text(item),),
//          ],);
//        }).toList(),
//      )
    ],);
  }
}