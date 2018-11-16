
import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("TextDemo"),
          ),
          body: ContentLayout(),
        ),

        onWillPop: (){
          Navigator.of(context).pop("返回的参数");
          return Future.value(false);
        });
  }
}

class ContentLayout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          widthFactor: 2.0,
          heightFactor: 2.0,
          child: ContentWidget(),
        ),
        ContentWidget(),
        Center(
          heightFactor: 3.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _widgets,
          ),
        )
      ],
    );
  }
}

class ContentWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _widgets,
    );
  }
}


final _widgets = <Widget>[
  Text("hello",
    textAlign: TextAlign.center,
    style: TextStyle(
        color: Colors.red,
        fontSize: 25.0,
        fontWeight: FontWeight.bold
    ),
  ),
  Text("hello",
    textAlign: TextAlign.center,
    style: TextStyle(
        color: Colors.red,
        fontSize: 25.0,
        fontWeight: FontWeight.normal
    ),
  ),
  Text("hello",
    textAlign: TextAlign.center,
    style: TextStyle(
        color: Colors.red,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
    ),
  ),
  RichText(
      text: TextSpan(
          text: "hello",
          style: TextStyle(
              color: Colors.red,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          ),
          children: <TextSpan>[
            TextSpan(
              text: "world",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),

          ]
      )
  ),
];