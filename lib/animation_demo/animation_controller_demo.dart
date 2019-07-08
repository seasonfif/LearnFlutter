import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => AnimationTestState();
}

class AnimationTestState extends State<AnimationTest> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
        vsync: this)
      ..addListener((){
        setState(() {
          //修改状态，引起build
        });
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300 * _animationController.value,
        width: 300 * _animationController.value,
        child: FlutterLogo(),
      ),
    );
  }

}