import 'package:flutter/material.dart';

class AnimatedBuiderDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => AnimatedBuiderDemoState();

}

class AnimatedBuiderDemoState extends State<AnimatedBuiderDemo> with SingleTickerProviderStateMixin{

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
    return GrowAnimation(animation:tween, child: LogoWidget(),);
  }
}


class GrowAnimation extends StatelessWidget{

  final Widget child;
  final Animation animation;

  const GrowAnimation({Key key, this.animation, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, widget){
            return Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          }),
    );
  }
}

class LogoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
    );
  }

}