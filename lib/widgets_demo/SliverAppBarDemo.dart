import 'package:flutter/material.dart';

//
// Created by seasonfif
// 2018/11/18.

class SliverAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            title: Text("SliverAppBarDemo"),
            centerTitle: true,
            elevation: 7,
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.red,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("SliverAppBarDemo"),
              collapseMode: CollapseMode.parallax,
              centerTitle: false,
              background: Image.asset("images/icon.png", fit: BoxFit.contain,),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_horiz, color: Colors.white,),
                tooltip: 'Air it',
                onPressed: (){

                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Text("SliverToBoxAdapter"),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (context, index){
                    return ListTile(
                      title: Text("List item $index"),
                    );
                  }, childCount: 50
              ),
              itemExtent: 50.0,
          )],
      ),
    );
  }
}
