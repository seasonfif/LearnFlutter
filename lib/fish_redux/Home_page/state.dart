import 'package:fish_redux/fish_redux.dart';
import 'package:learn_flutter/fish_redux/entity/weather.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeState implements Cloneable<HomeState> {

  RefreshController refreshController;
  List<Weather> list;

  @override
  HomeState clone() {
    return HomeState()
      ..refreshController = refreshController
      ..list = list;
  }
}

HomeState initState(Map<String, dynamic> args) {
  HomeState state = HomeState();
  state.refreshController = RefreshController();
  state.list = List();
  return state;
}
