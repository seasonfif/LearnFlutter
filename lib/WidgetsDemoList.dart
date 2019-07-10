import 'package:flutter/material.dart';

import 'platform_service/log_util.dart';

class WidgetsDemoList extends StatefulWidget {

  final BuildContext parent;

  WidgetsDemoList({this.parent});

  @override
  State<StatefulWidget> createState() {
    return WidgetsDemoListState(parent: parent);
  }
}

class WidgetsDemoListState extends State {
  final BuildContext parent;
  WidgetsDemoListState({this.parent});

  @override
  void initState() {
    super.initState();
    LogUtil.e("WidgetsDemoList->initState");
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.d("WidgetsDemoList->build");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SecondPage",
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("WidgetsDemoList"),
        ),
        body: WidgetsListView(parent: parent,)),
    );
  }
}

class WidgetsListView extends StatefulWidget{
  final BuildContext parent;
  WidgetsListView({this.parent});

  @override
  State<StatefulWidget> createState() {
    return WidgetsListViewState();
  }
}

class WidgetsListViewState extends State<WidgetsListView> with AutomaticKeepAliveClientMixin{

  final _widgetsList = <String>[
    "LayoutDemo",
    "TextDemo",
    "ImageDemo",
    "CardDemo",
    "StackDemo",
    "ContainerDemo",
    "SliverAppBarDemo",
    "AnimationDemo",
    "AnimatedWidgetDemo",
    "AnimatedBuiderDemo",
    "StaggerAnimationDemo",
  ];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    Iterable<Widget> widgetTiles = _widgetsList.map((item){
      return _buildListTile(item);
    });

    widgetTiles = ListTile.divideTiles(context: context, tiles: widgetTiles,);

    return ListView(
      children: widgetTiles.toList(),
    );
  }

  Widget _buildListTile(item) {
    return ListTile(
      title: Text(item),
      trailing: Icon(Icons.chevron_right),
      onTap: _itemTapped(item),
      onLongPress: _itemLongPressed(item),
    );
  }

  _itemTapped(item) => (){
      //显示跳转 直接指定跳转的页面
      /*Navigator.of(widget.parent)
          .push(MaterialPageRoute(builder: (context) => TextDemo()))
          .then((result){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("snakebar: $result"), duration: Duration(milliseconds: 500),));
          });*/

      //隐式跳转 先定义路由表，后使用key跳转
      //这里的context是当前界面的 能获取当前页面注册的路由表信息
      Navigator.of(widget.parent).pushNamed(item);
  };

  _itemLongPressed(item) => (){
    _showStatelessDialog(item, context);
    //_showStatefulDialog(index, context);
  };

  _showStatelessDialog(item, context) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("item"),
          content: Text("点击了$item"),
          actions: <Widget>[
            FlatButton(
              child: Text("确定"),
              onPressed: () {
                //先取消dialog，再跳转
                Navigator.of(context).pop();

                //显示跳转 直接指定跳转的页面
                /*Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TextDemo()));*/

                //隐式跳转 先定义路由表，后使用key跳转
                //这里的context不是当前界面的 经测试它获取的是main页面注册的路由表信息 这或许跟pageview架构有关
                Navigator.of(context).pushNamed(item);
              },
            ),
            FlatButton(
              child: Text("取消"),
              onPressed: () {
                Navigator.of(context).pop();

//              显示flutter授权 授权内容已经由flutter内部实现
//              showAboutDialog(context: context);
//              showLicensePage(context: context);
              },
            )
          ],
        );
      });

  void _showStatefulDialog(index, context) => showDialog(
      context: context,
      builder: (context) {
        String label = "hello";
        return StatefulBuilder(
            builder: (context, state){
              return Center(
                child: Column(
                  children: <Widget>[
                    Text(label, style: TextStyle(fontSize: 25.0),),
                    FlatButton(
                        onPressed: (){
                          state((){
                            label = "hello world";
                          });
                        },
                        child: Text("确定"))
                  ],
                ),
              );
            });
      }
  );
}
