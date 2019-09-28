
import 'package:flutter/material.dart';

class DouyinLayout extends StatefulWidget {
  @override
  _DouyinLayoutState createState() => _DouyinLayoutState();
}

class _DouyinLayoutState extends State<DouyinLayout> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.yellowAccent
          ),
          child: Home(),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.yellowAccent),
        ),

        Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.pinkAccent),
        ),

        Container(
          alignment: Alignment(1.0, -1.0),
          margin: EdgeInsets.only(top:300),
          width: 100,
          height: 300,
          decoration: BoxDecoration(color: Colors.white),
        ),

        // Container(
        //   margin: EdgeInsets.only(bottom: 0),
        //   width: 100,
        //   height: 100,
        //   decoration: BoxDecoration(color: Colors.white),
        // ),

        Positioned(
          left: 0,
          bottom: 0,
          height: 150,
          width: 0.7 * width,
          child: Container(
            decoration: BoxDecoration(color: Colors.red),
          ),
        )
      ]
    ); 
  }
}