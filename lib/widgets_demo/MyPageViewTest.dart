import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets_demo/MyPageView.dart';

class MyPageViewLayout extends StatefulWidget {

  final BuildContext parent;

  MyPageViewLayout({this.parent});

  @override
  State<StatefulWidget> createState() {
    return MyPageViewLayoutState(parent: parent);
  }
}

class MyPageViewLayoutState extends State {
  final BuildContext parent;
  MyPageViewLayoutState({this.parent});

  @override
  Widget build(BuildContext context) {
    List datas = List<String>();
    datas.add("a");
    datas.add("b");
    datas.add("c");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("DartDemoList"),
          ),
          body: MyPageView(
            datas,
            headerWidgetBuild: makeHeader,
            footerWidgetBuild: makeFooter,
            ),
    
      ),
    );
  }

  Widget makeHeader(){
    return Container(
        decoration: BoxDecoration(
            color: Colors.black38
        ),
        child: GestureDetector(
          child:  Text("这是一个header"),
          onTap:(){
            print("点击了header");
          },),
    );
  }

  Widget makeFooter(){
    return GestureDetector(
      child: Container(
        color: Colors.red,
        child: Text("这是一个footer"),
      ),
      onTap:(){
        print("点击了footer");
      }
    );
  }
}
