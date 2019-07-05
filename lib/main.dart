import 'package:flutter/material.dart';
import 'package:learn_flutter/DartDemoList.dart';
import 'package:learn_flutter/ListPage.dart';
import 'package:learn_flutter/WidgetsDemoList.dart';
import 'package:learn_flutter/SettingsPage.dart';
import 'package:learn_flutter/dart_demo/AsyncDemo.dart';
import 'package:learn_flutter/video_page.dart';
import 'package:learn_flutter/widgets_demo/CardDemo.dart';
import 'package:learn_flutter/widgets_demo/ContainerDemo.dart';
import 'package:learn_flutter/widgets_demo/ImageDemo.dart';
import 'package:learn_flutter/widgets_demo/SliverAppBarDemo.dart';
import 'package:learn_flutter/widgets_demo/StackDemo.dart';
import 'package:learn_flutter/widgets_demo/TextDemo.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

//    debugPaintSizeEnabled = true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      showPerformanceOverlay: true,
      title: "LearnFlutter",
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "TextDemo" : (context){ return TextDemo(); },
        "ImageDemo" : (context){ return ImageDemo(); },
        "CardDemo" : (context){ return CardDemo(); },
        "StackDemo" : (context){ return StackDemo(); },
        "ContainerDemo" : (context){ return ContainerDemo(); },
        "SliverAppBarDemo" : (context){ return SliverAppBarDemo(); },
        "AsyncDemo" : (context){ return AsyncDemo(); },
      },
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{

  int _index = 0;

  var _pageController = PageController();

  var _pages;

  void initData(context) {
    _pages = <Widget>[ListPage(), WidgetsDemoList(parent: context,), VideoPage(parent: context,), SettingsPage()];
  }

  @override
  Widget build(BuildContext context) {
    initData(context);
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Demo"),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
//        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), activeIcon: Icon(Icons.message, color: Colors.red), title: Text("消息")),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), activeIcon: Icon(Icons.contacts, color: Colors.red,),title: Text("通讯录")),
          BottomNavigationBarItem(icon: Icon(Icons.search), activeIcon: Icon(Icons.search, color: Colors.red,), title: Text("发现")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), activeIcon: Icon(Icons.settings, color: Colors.red,), title: Text("设置")),
        ],
        currentIndex: _index,
        onTap: (index){
          setState(() {
            _index = index;
          });
          _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
        },
      ),
      body: PageView(
        children: _pages,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index){
          setState(() {
            _index = index;
          });
        },
      ),
      /*body: PageView.builder(
        itemCount: 4,
        controller: _pageController,
        itemBuilder: (context, index){

          var str = "item $_index";

          return Center(
            child: Text(str),
          );
        },
        onPageChanged: (index){
          setState(() {
            _index = index;
          });
        },
      ),*/
    );
  }
}