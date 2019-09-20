import 'package:fish_redux/fish_redux.dart';
import 'package:learn_flutter/fish_redux/Home_page/state.dart';
import 'package:learn_flutter/fish_redux/Home_page/weather_component/component.dart';
import 'package:learn_flutter/fish_redux/Home_page/weather_component/state.dart';
import 'package:learn_flutter/fish_redux/entity/weather.dart';

import 'reducer.dart';

class WeatherAdapter extends DynamicFlowAdapter<HomeState>{

  WeatherAdapter():super(
    pool: <String, Component<Object>>{
      'weather': WeatherComponent(),
    },
    connector: _WeatherConnector(),
    reducer: buildReducer(),
  );
}

class _WeatherConnector extends ConnOp<HomeState, List<ItemBean>>{

  @override
  List<ItemBean> get(HomeState state) {
    if(state.list.isNotEmpty == true){
        return state.list.map<ItemBean>((m){
            WeatherState weatherState = WeatherState();
            weatherState.weather = m;
            return ItemBean('weather', weatherState);
        }).toList();
    }else{
      return <ItemBean>[];
    }
  }

  @override
  void set(HomeState state, List<ItemBean> items) {
    if(state.list.isNotEmpty){
      state.list = List<Weather>.from(items.map((m){
        return m.data;
      })).toList();
    }else{
      state.list = List();
    }
  }

}