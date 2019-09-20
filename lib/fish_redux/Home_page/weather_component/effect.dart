import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WeatherState> buildEffect() {
  return combineEffects(<Object, Effect<WeatherState>>{
    WeatherAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WeatherState> ctx) {
}
