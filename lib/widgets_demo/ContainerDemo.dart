import 'package:flutter/material.dart';

//
// Created by seasonfif
// 2018/11/17.

class ContainerDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ContainerDemo"),
      ),

      body: _buildBody(context),
    );
  }
}

_buildBody(context){
  return Container(
    constraints: BoxConstraints.expand(
      height: 150.0,),
    padding: EdgeInsets.all(10.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.blue,
      border: Border.all(color: Colors.red, width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(7.0)),
      image: DecorationImage(image: AssetImage("images/hotel.png")),
    ),
    child: Text("hello flutter1hello flutter2hello flutter3hello flutter4"),
    transform: Matrix4.rotationZ(0.3),
  );
}