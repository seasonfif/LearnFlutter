
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'Home_page/page.dart';
import 'Login_page/page.dart';

Widget createApp(){
  AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'login' : LoginPage(),
      // 'register' : RegisterPage(),
      'home' : HomePage(),
    },
  );

  return MaterialApp(
    title: 'fish app',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: routes.buildPage('login', null),
    onGenerateRoute: (RouteSettings settings){
      return MaterialPageRoute<Object>(
        builder: (context)=>
          routes.buildPage(settings.name, settings.arguments)
      );
    },
  );
}