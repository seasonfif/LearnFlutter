
import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageDemo"),
      ),
      body: ContentWidget(),
    );
  }
}

class ContentWidget extends StatelessWidget {

  static Widget _wrapContainer(d, widget){
    return Container(
      width: d,
      height: d,
      child: widget,
    );
  }

  static Widget _wrapExpaned(widget, flex){
    return Expanded(child: widget, flex: flex,);
  }

  var _images = <Widget>[
    _wrapContainer(270.0, Image.asset("images/car.png")),
    _wrapContainer(270.0, Image.asset("images/hotel.png")),
    _wrapContainer(270.0, Image.asset("images/shopping.png")),
  ];

  var _images_expaned = <Widget>[
    _wrapExpaned(Image.asset("images/car.png"), 1),
    _wrapExpaned(Image.asset("images/hotel.png"), 1),
    _wrapExpaned(Image.asset("images/shopping.png"), 1),
  ];


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _images_expaned,
    );
  }
}