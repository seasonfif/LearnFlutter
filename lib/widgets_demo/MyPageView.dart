import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

typedef ItemWidgetBuild = Widget Function(BuildContext context, int position);

typedef HeaderWidgetBuild = Widget Function();

typedef FooterWidgetBuild = Widget Function();

class MyPageView extends StatefulWidget {
  List datas; //主list数据集合

  Axis scrollDirection = Axis.vertical; //滑动方向,默认是竖向滑动

  ItemWidgetBuild itemWidgetBuild;
  HeaderWidgetBuild headerWidgetBuild;
  FooterWidgetBuild footerWidgetBuild;

  MyPageView(
    this.datas, {
    Key key,
    this.scrollDirection,
    this.itemWidgetBuild,
    this.headerWidgetBuild,
    this.footerWidgetBuild,
  }) : super(key: key);

  @override
  _MyPageView createState() => _MyPageView();
}

/**
 * 目前的header和footer的高度都是小于整屏高度的
 */
class _MyPageView extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView.builder(
      itemBuilder: (context, index) {
        return _buildItemWidget(context, index);
      },
      itemCount: widget.datas.length,
      scrollDirection: Axis.vertical,
    ));
  }

  _buildItemWidget(BuildContext context, int index) {
    if (index < 1 && widget.headerWidgetBuild != null) {
      return _headerItemWidget(context, index);
    } else if (index == widget.datas.length-1) {
      return _footerItemWidget(context, index);
    } else {
      return _itemWidgetBuild(context, index);
    }
  }


  _headerItemWidget(BuildContext context, int index) {
    Widget w;
    if (widget.scrollDirection == Axis.horizontal) {
      w = Row(
        children: <Widget>[],
      );
    } else {
      w = Column(
        children: <Widget>[
          widget.headerWidgetBuild(),
          Expanded(
            child: _itemWidgetBuild(context, index),
          )
        ],
      );
    }
    return w;
  }

  _itemWidgetBuild(BuildContext context, int index) {
    if (widget.itemWidgetBuild != null) {
      return widget.itemWidgetBuild;
    } else {
      return Container(
        color: index%2==0?Colors.amber:Colors.blue,
        child: GestureDetector(
          child: Text(
            "这是第$index个pageView数据",
            style: TextStyle(
              color: Colors.red,
              fontSize: 50.0,
            ),
          ),
          onTap: () {
            //点击事件
          },
        ),
      );
    }
  }

  _footerItemWidget(BuildContext context, int index) {
    Widget w;
    if (widget.scrollDirection == Axis.horizontal) {
      w = Row(
        children: <Widget>[],
      );
    } else {
      w = Column(
        children: <Widget>[
          Expanded(
            child: _itemWidgetBuild(context, index),
          ),
          widget.footerWidgetBuild(),
        ],
      );
    }
    return w;
  }
}
