import 'package:flutter/material.dart';

class StaggerAnimationDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StaggerAnimationDemoState();
}

class StaggerAnimationDemoState extends State<StaggerAnimationDemo> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StaggerAnimation"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color:  Colors.black.withOpacity(0.5),
              ),
            ),
            child: StaggerAnimation(controller: _animationController.view),
          ),
        ),
      ),
    );
  }

  void _playAnimation() async {
    await _animationController.forward().orCancel;
    await _animationController.reverse().orCancel;

  }
}

class StaggerAnimation extends StatelessWidget{

  final Animation controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color> color;

  StaggerAnimation({Key key, this.controller}) :
      opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.1, curve: Curves.ease))),
      width = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.125, 0.25, curve: Curves.ease))),
      height = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.25, 0.375, curve: Curves.ease))),
      padding = EdgeInsetsTween(begin: EdgeInsets.only(bottom: 16.0), end: EdgeInsets.only(bottom: 75.0))
          .animate(CurvedAnimation(parent: controller, curve: Interval(0.25, 0.375, curve: Curves.ease))),
      borderRadius = BorderRadiusTween(begin: BorderRadius.circular(4.0), end: BorderRadius.circular(75.0))
          .animate(CurvedAnimation(parent: controller, curve: Interval(0.375, 0.5, curve: Curves.ease))),
      color = ColorTween(begin: Colors.indigo[100], end: Colors.indigo[400])
          .animate(CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.ease))),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: _buildAnimation);
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            borderRadius: borderRadius.value,
            border: Border.all(
              width: 3.0,
              color: Colors.indigo[300]
            )
          ),
        ),
      ),
    );
  }
}