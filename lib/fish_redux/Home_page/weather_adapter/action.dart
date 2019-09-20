import 'package:fish_redux/fish_redux.dart';
import 'package:learn_flutter/fish_redux/entity/weather.dart';

enum WeatherAction{
  setNewData,
  setEmptyData
}

class WeatherActionCreator{
  static Action onSetNewData(List<Weather> list){
    return Action(
      WeatherAction.setNewData,
      payload: list);
  }

  static Action onSetEmptyData(){
    return Action(WeatherAction.setEmptyData);
  }
}