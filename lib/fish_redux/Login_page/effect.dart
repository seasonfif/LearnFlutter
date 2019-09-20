import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.login: _onLogin,
  });
}

void _onLogin(Action action, Context<LoginState> ctx) async {

  Map<String, dynamic> params = {
    'name': ctx.state.usernameController.text,
    'passwd':ctx.state.passwdController.text,
    'apikey':'3eb1f998adcccb0715dd3deb760be552'
  };

  Response response = await Dio().post(
    "https://api.apiopen.top/loginUser",
    queryParameters: params
  );

  int code = response.data['code'];
  String msg = response.data['message'];
  if(code == 200){
    Fluttertoast.showToast(msg: '登录成功');
    Navigator.of(ctx.context).pushNamed('home', arguments: null);
  }else{
    Fluttertoast.showToast(msg: '登录失败:$msg');
  }
}
