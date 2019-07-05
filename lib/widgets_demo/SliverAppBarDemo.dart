import 'package:flutter/material.dart';

//
// Created by seasonfif
// 2018/11/18.

class SliverAppBarDemo extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("SliverAppBarDemo"),
            centerTitle: false,
            elevation: 7.0,
            forceElevated: true,
            expandedHeight: 270.0,
            pinned: true,
            backgroundColor: Colors.red,
            floating: false,
            primary: true, //appbar是否显示在屏幕的最上面，为false是显示在最上面，为true就显示在状态栏的下面
//            titleSpacing: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hello"),
              collapseMode: CollapseMode.parallax,
              centerTitle: false,
              background: Image.asset("images/beauty.jpeg", fit: BoxFit.cover,),
            ),
            actions: <Widget>[
              PopupMenuButton<String>(
                padding: EdgeInsets.all(10.0),
                  onSelected: (select){
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(select), duration: Duration(seconds: 1),));
                  },
                  itemBuilder: (context){
                    return [
                      const PopupMenuItem<String>(
                          value: 'Preview',
                          child: ListTile(
                              leading: Icon(Icons.visibility),
                              title: Text('Preview')
                          )
                      ),
                      const PopupMenuItem<String>(
                          value: 'Share',
                          child: ListTile(
                              leading: Icon(Icons.person_add),
                              title: Text('Share')
                          )
                      ),
                      const PopupMenuItem<String>(
                          value: 'Get Link',
                          child: ListTile(
                              leading: Icon(Icons.link),
                              title: Text('Get link')
                          )
                      ),
                      const PopupMenuDivider(),
                      const PopupMenuItem<String>(
                          value: 'Remove',
                          child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Remove')
                          )
                      )
                    ];
              }),
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
