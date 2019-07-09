import 'package:flutter/material.dart';

class AnimatedWidgetDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => AnimatedWidgetDemoState();

}

class AnimatedWidgetDemoState extends State<AnimatedWidgetDemo> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation tween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration:Duration(seconds: 2), vsync: this,);
    tween = Tween(begin: 0.0, end: 300.0).animate(_animationController);
    tween.addStatusListener((status){
      switch(status){

        case AnimationStatus.dismissed:
          _animationController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
        case AnimationStatus.completed:
          _animationController.reverse();
          break;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animationInner: tween);
  }
}

class AnimatedLogo extends AnimatedWidget{

  AnimatedLogo({Animation animationInner, Key key}): super(key: key, listenable: animationInner);

  @override
  Widget build(BuildContext context) {

    final Animation _animationInner = listenable;

    return Center(
      child: Container(
        width: _animationInner.value,
        height: _animationInner.value,
        child: FlutterLogo(),
      ),
    );
  }

}