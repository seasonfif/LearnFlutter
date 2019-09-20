import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WeatherState> buildReducer() {
  return asReducer(
    <Object, Reducer<WeatherState>>{
      WeatherAction.action: _onAction,
    },
  );
}

WeatherState _onAction(WeatherState state, Action action) {
  final WeatherState newState = state.clone();
  return newState;
}
