import 'package:flutter/material.dart';
import 'package:learn_flutter/ListPage.dart';
import 'package:learn_flutter/SecondPage.dart';
import 'package:learn_flutter/widgets_demo/TextDemo.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LearnFlutter",
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "TextDemo1" : (context){ return TextDemo(); },
        "TextDemo2" : (context){ return TextDemo(); },
        "TextDemo3" : (context){ return TextDemo(); },
        "TextDemo4" : (context){ return TextDemo(); },
        "TextDemo5" : (context){ return TextDemo(); },
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
    _pages = <Widget>[ListPage(), SecondPage(parent: context,), SecondPage(parent: context,), SecondPage(parent: context,)];
  }

  @override
  Widget build(BuildContext context) {
    initData(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
//        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), activeIcon: Icon(Icons.message, color: Colors.red), title: Text("消息")),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), activeIcon: Icon(Icons.contacts, color: Colors.red,),title: Text("通讯录")),
          BottomNavigationBarItem(icon: Icon(Icons.search), activeIcon: Icon(Icons.search, color: Colors.red,), title: Text("发现")),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), activeIcon: Icon(Icons.account_circle, color: Colors.red,), title: Text("我")),
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