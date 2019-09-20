
import 'package:fish_redux/fish_redux.dart';
import 'package:learn_flutter/fish_redux/Home_page/state.dart';
import 'package:learn_flutter/fish_redux/Home_page/weather_adapter/action.dart';

Reducer<HomeState> buildReducer(){
  return asReducer(
    <Object, Reducer<HomeState>>{
      WeatherAction.setNewData: _setNewData,
      WeatherAction.setEmptyData: _setEmptyData,
    }
    );
}

HomeState _setNewData(HomeState state, Action action){
  HomeState newState = state.clone();
  newState.list = action.payload;
  return newState; 
}

HomeState _setEmptyData(HomeState state, Action action){
  HomeState newState = state.clone();
  newState.list.clear();
  return newState;
}