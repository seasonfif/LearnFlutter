import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WeatherComponent extends Component<WeatherState> {
  WeatherComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WeatherState>(
                adapter: null,
                slots: <String, Dependent<WeatherState>>{
                }),);

}
