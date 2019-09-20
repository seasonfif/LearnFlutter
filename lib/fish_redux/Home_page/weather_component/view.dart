import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'state.dart';

Widget buildView(WeatherState state, Dispatch dispatch, ViewService viewService) {
  return Card(
    color: Colors.white,
    child: Container(
      child: ListTile(
        leading: Text(state.weather.date),
        title: Text(state.weather.high),
        subtitle: Text(state.weather.low),
        trailing: Text(state.weather.type),
        onTap: () {
          Fluttertoast.showToast(msg:'item被点击了');
        },
      ),
    ),
  );
}
