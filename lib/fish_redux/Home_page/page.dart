import 'package:fish_redux/fish_redux.dart';
import 'package:learn_flutter/fish_redux/Home_page/weather_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: NoneConn<HomeState>() + WeatherAdapter(),
            ),
          );

}
