import 'package:flutter/material.dart';

class DartDemoList extends StatefulWidget {

  final BuildContext parent;

  DartDemoList({this.parent});

  @override
  State<StatefulWidget> createState() {
    return DartDemoListState(parent: parent);
  }
}

class DartDemoListState extends State {
  final BuildContext parent;
  DartDemoListState({this.parent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DartDemoList"),
        ),
        body: DartListView(parent: parent,));
  }
}

class DartListView extends StatefulWidget{
  final BuildContext parent;
  DartListView({this.parent});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DartListViewState();
  }
}

class DartListViewState extends State<DartListView> with AutomaticKeepAliveClientMixin{

  final _widgetsList = <String>[
    "AsyncDemo",
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
}
