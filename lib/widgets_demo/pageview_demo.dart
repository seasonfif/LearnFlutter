import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class PageViewDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => PageViewDemoState();
}

class PageViewDemoState extends State<PageViewDemo>{

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PageViewDemo"),
        ),
        body: _buildPageView());
  }

  Widget _buildPageView() {
    return TransformerPageView(
      scrollDirection: Axis.vertical,
      transformer: ScaleAndFadeTransformer(),
      viewportFraction: 1.0,
      itemBuilder: _buildItem,
      itemCount: 10,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      color: Colors.indigo[(index+1) * 100],
      child: Center(
        child: new Text('$index', style: TextStyle(fontSize: 64.0)),
      ),
    );
  }
}

class ScaleAndFadeTransformer extends PageTransformer {
  final double _scale;
  final double _fade;

  ScaleAndFadeTransformer({double fade: 0.3, double scale: 0.8})
      : _fade = fade,
        _scale = scale;

  @override
  Widget transform(Widget item, TransformInfo info) {
    double position = info.position;
    double scaleFactor = (1 - position.abs()) * (1 - _scale);
    double fadeFactor = (1 - position.abs()) * (1 - _fade);
    double opacity = _fade + fadeFactor;
    double scale = _scale + scaleFactor;
    return new Opacity(
      opacity: opacity,
      child: new Transform.scale(
        scale: scale,
        child: item,
      ),
    );
  }
}