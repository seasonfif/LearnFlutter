
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DouyinLayout extends StatefulWidget {
  @override
  _DouyinLayoutState createState() => _DouyinLayoutState();
}

class _DouyinLayoutState extends State<DouyinLayout> {

  RefreshController _refreshController = RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: SmartRefresher(
          onRefresh: () async{

            await Future.delayed(Duration(milliseconds: 1000));
            _refreshController.refreshCompleted();
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellowAccent
            ),
            child: Home(),
          ),

          controller: _refreshController,
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
          height: 100,
          decoration: BoxDecoration(color: Colors.pinkAccent),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(bottom: 150),
            width: 100,
            height: 250,
            decoration: BoxDecoration(color: Colors.white),
          ),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(color: Colors.green),
          ),
        ),

        // Positioned(
        //   left: 0,
        //   bottom: 0,
        //   height: 150,
        //   width: 0.7 * width,
        //   child: Container(
        //     decoration: BoxDecoration(color: Colors.red),
        //   ),
        // ),

        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: 0.7 * width,
            height: 150,
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
      ]
    ); 
  }
}