import 'package:flutter/material.dart';
import 'package:learn_flutter/demo_app.dart';
import 'package:learn_flutter/redux/count_state.dart';
import 'package:redux/redux.dart';
import 'redux/redux_demo.dart';
import 'scoped_model/scope_demo.dart';

void main(){
  run_scope();
  // run_redux();
  // run_demo();
}

void run_demo(){
  runApp(DemoApp());
}

void run_redux(){
  final store = Store<CountState>(reducer, initialState: CountState.initState());
  runApp(ReduxApp(store));
}

void run_scope(){
  runApp(ScopeApp());
}