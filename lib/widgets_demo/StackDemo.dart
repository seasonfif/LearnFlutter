
import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StackDemo"),
      ),
      body: _buildStackBody(),
    );
  }
}

_buildStackBody() {
  return Stack(
    alignment: Alignment(0.5, 0.5),
    children: <Widget>[
      CircleAvatar(
        radius: 120.0,
        backgroundImage: AssetImage("images/fj.jpeg"),
      ),

      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 7.0),
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          color: Colors.white12
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text("seasonfif",
            style: TextStyle(color: Colors.white, fontSize: 28.0),
          ),
        ),
      )
    ],
  );
}