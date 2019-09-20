import 'package:fish_redux/fish_redux.dart';
import 'package:learn_flutter/fish_redux/entity/weather.dart';

class WeatherState implements Cloneable<WeatherState> {

  Weather weather;

  get w => weather;

  @override
  WeatherState clone() {
    return WeatherState()..weather = weather;
  }
}

WeatherState initState(Map<String, dynamic> args) {
  return WeatherState();
}
