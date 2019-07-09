import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => AnimationTestState();
}

class AnimationTestState extends State<AnimationDemo> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  CurvedAnimation _curvedAnimation;
  Animation tween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this);

    //差值器
    _curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);

    tween = Tween(begin: 0.0, end: 300.0).animate(_curvedAnimation)
      ..addListener((){
        setState(() {
          //修改状态，引起build
        });
      });
    _animationController.forward();
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
        title: Text("AnimationControllerDemo"),
      ),
      body: Center(
        child: Container(
          /*height: 300 * _animationController.value,
        width: 300 * _animationController.value,*/
          height: tween.value,
          width: tween.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }

}