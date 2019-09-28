import 'package:flutter/material.dart';
import 'package:learn_flutter/demo_app.dart';
import 'package:learn_flutter/fish_redux/fish_app.dart';
import 'package:learn_flutter/redux/count_state.dart';
import 'package:redux/redux.dart';
import 'redux/redux_demo.dart';
import 'scoped_model/scope_demo.dart';

void main(){
  // runFishRedux();
  // runScope();
  // run_redux();
  runDemo();
}

void runDemo(){
  runApp(DemoApp());
}

void runRedux(){
  final store = Store<CountState>(reducer, initialState: CountState.initState());
  runApp(ReduxApp(store));
}

void runScope(){
  runApp(ScopeApp());
}

void runFishRedux(){
  runApp(createApp());
}