
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SecondPage",
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: Scaffold(
        body: Center(
          child: Image.asset("images/icon.png"),
        ),
      ),
    );
  }

}