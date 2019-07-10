import 'package:flutter/material.dart';

import 'layout_demo/image_text_column.dart';

class LayoutDemo extends StatefulWidget {

  final BuildContext parent;

  LayoutDemo({this.parent});

  @override
  State<StatefulWidget> createState() {
    return LayoutDemoState(parent: parent);
  }
}

class LayoutDemoState extends State {
  final BuildContext parent;
  LayoutDemoState({this.parent});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("DartDemoList"),
          ),
          body: LayoutDemoListView(parent: parent,)
      ),
      routes: {
        "ImageTextColumn":(context){return ImageTextColumn();},
      },
    );
  }
}

class LayoutDemoListView extends StatefulWidget{
  final BuildContext parent;
  LayoutDemoListView({this.parent});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LayoutDemoListViewState();
  }
}

class LayoutDemoListViewState extends State<LayoutDemoListView> with AutomaticKeepAliveClientMixin{

  final _layoutList = <String>[
    "ImageTextColumn",
  ];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    Iterable<Widget> widgetTiles = _layoutList.map((item){
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
      Navigator.of(context).pushNamed(item);
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
}
