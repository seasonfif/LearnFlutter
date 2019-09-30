import 'package:flutter/material.dart';
import 'package:learn_flutter/SettingsPage.dart';
import 'package:learn_flutter/WidgetsDemoList.dart';
import 'package:learn_flutter/dart_demo/AsyncDemo.dart';
import 'package:learn_flutter/layout_demo/douyin.dart';
import 'package:learn_flutter/widgets_demo/CardDemo.dart';
import 'package:learn_flutter/widgets_demo/ContainerDemo.dart';
import 'package:learn_flutter/widgets_demo/ImageDemo.dart';
import 'package:learn_flutter/widgets_demo/SliverAppBarDemo.dart';
import 'package:learn_flutter/widgets_demo/StackDemo.dart';
import 'package:learn_flutter/widgets_demo/TextDemo.dart';
import 'package:learn_flutter/widgets_demo/page_demo.dart';
import 'package:learn_flutter/widgets_demo/pageview_demo.dart';
import 'package:learn_flutter/widgets_demo/scaled_layout.dart';

import 'animation_demo/animated_buider_demo.dart';
import 'animation_demo/animated_widget_demo.dart';
import 'animation_demo/animation_controller_demo.dart';
import 'animation_demo/stagger_animation_demo.dart';
import 'layout_demo.dart';
import 'widgets_demo/video_demo.dart';
import 'widgets_demo/video_page_demo.dart';

class DemoApp extends StatelessWidget{

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
        "LayoutDemo" : (context){ return LayoutDemo(); },
        "VideoPageDemo" : (context){ return VideoPageDemo(); },
        "VideoDemo" : (context){ return VideoDemo(); },
        "ScaledLayout" : (context){ return ScaledLayout(); },
        "TextDemo" : (context){ return TextDemo(); },
        "ImageDemo" : (context){ return ImageDemo(); },
        "CardDemo" : (context){ return CardDemo(); },
        "StackDemo" : (context){ return StackDemo(); },
        "ContainerDemo" : (context){ return ContainerDemo(); },
        "SliverAppBarDemo" : (context){ return SliverAppBarDemo(); },
        "AnimationDemo" : (context){ return AnimationDemo(); },
        "AnimatedWidgetDemo" : (context){ return AnimatedWidgetDemo(); },
        "AnimatedBuiderDemo" : (context){ return AnimatedBuiderDemo(); },
        "StaggerAnimationDemo" : (context){ return StaggerAnimationDemo(); },
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
    _pages = <Widget>[VideoPageDemo(), WidgetsDemoList(parent: context,), DouyinLayout(), SettingsPage()];
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