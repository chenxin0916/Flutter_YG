import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/Net/DioManager.dart';
import 'package:flutterapp/Net/Url.dart';
import 'package:flutterapp/constant/CommonColor.dart';
import 'package:flutterapp/constant/CommonString.dart';
import 'package:flutterapp/mode/LoginSuccessResponse.dart';
import 'package:flutterapp/page/ConversionPage.dart';
import 'package:flutterapp/page/HomePage.dart';
import 'package:flutterapp/page/LivePage.dart';
import 'package:flutterapp/page/MinePage.dart';
import 'package:flutterapp/page/WorthPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex;
  List<Widget> _pageArray =[HomePage(),WorthPage(),LivePage(),ConversionPage(),MinePage()];
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset("image/homepage.svg",width: 24, height: 24),
      activeIcon: SvgPicture.asset("image/homepage_fill.svg",width: 24, height: 24),
      title: Text(CommonString.HOME),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("image/integral.svg",width: 24, height: 24),
      activeIcon: SvgPicture.asset("image/integral_fill.svg",width: 24, height: 24),
      title: Text(CommonString.WORTH_STR),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("image/integral.svg",width: 24, height: 24),
      activeIcon: SvgPicture.asset("image/integral_fill.svg",width: 24, height: 24),
      title: Text(CommonString.LIVING,),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("image/interactive.svg",width: 24, height: 24),
      activeIcon: SvgPicture.asset("image/interactive_fill.svg",width: 24, height: 24),
      title: Text(CommonString.CONVERSION_SKILL),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("image/mine.svg",width: 24, height: 24),
      activeIcon: SvgPicture.asset("image/mine_fill.svg",width: 24, height: 24),
      title: Text(CommonString.MINE),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    DioManager().request<LoginSuccessResponse>(
        method: "get",
        url: Url.VISITOR_LOGIN,
        params: {},
        onSuccess: (data){
          print("============================" + data["token"]);
          DioManager().init(data["token"]);
        },
        onError: (error){
          print("============================");
          print(error.errorCode);
          print("============================");
        }
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: CommonColor.color_main_tab_selected,
        unselectedItemColor: CommonColor.color_main_tab_unSelected,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if(index != _currentIndex) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
      body: Container(child: _pageArray[_currentIndex]),
    );
  }
}

