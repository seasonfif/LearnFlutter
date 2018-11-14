import 'package:flutter/material.dart';

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
      home: HomePage()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
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
          _pageController.animateToPage(index, duration: Duration(seconds: 2), curve: ElasticOutCurve(0.8));
          print("tapped: $index");
        },
      ),
      body: PageView.builder(
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
      ),
    );
  }
}