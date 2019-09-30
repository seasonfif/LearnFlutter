import 'package:flutter/material.dart';
import 'package:learn_flutter/platform_service/log_util.dart';

class PageDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => PageDemoState();
}

class PageDemoState extends State<PageDemo>{

  PageController pageController = PageController();

  double pageOffset = 0.0;

  @override
  void initState() {
    super.initState();
    LogUtil.e("PageViewDemo->initState");
    pageController.addListener((){
      
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.d("PageViewDemo->build");
    return Scaffold(
        appBar: AppBar(
          title: Text("PageViewDemo"),
        ),
        body: _buildPageView());
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      color: Colors.indigo[(index+1) * 100],
      child: Center(
        child: new Text('$index', style: TextStyle(fontSize: 64.0)),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: pageController,
      itemBuilder: (context, index){
        return _buildItem(context, index);
      },
      itemCount: 100,);
  }
}