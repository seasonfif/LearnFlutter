import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState implements Cloneable<LoginState> {

  TextEditingController usernameController;
  TextEditingController passwdController;

  @override
  LoginState clone() {
    return LoginState()
      ..usernameController = usernameController
      ..passwdController = passwdController;
  }
}

LoginState initState(Map<String, dynamic> args) {
  LoginState state = LoginState();
  state.usernameController = TextEditingController();
  state.passwdController = TextEditingController();
  return state;
}
