
import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("TextDemo"),
          ),
          body: ContentWidget(),
        ),

        onWillPop: (){
          Navigator.of(context).pop("返回的参数");
          return Future.value(false);
        });


  }
}

class ContentWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("hello flutter",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.red,
              fontSize: 25.0,
              fontWeight: FontWeight.bold
          ),
        ),
        Text("hello flutter",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.red,
              fontSize: 25.0,
              fontWeight: FontWeight.normal
          ),
        ),
        Text("hello flutter",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.red,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          ),
        ),
      ],
    );
  }
}