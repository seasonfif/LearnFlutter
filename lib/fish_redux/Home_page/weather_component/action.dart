import 'package:fish_redux/fish_redux.dart';

enum WeatherAction { action }

class WeatherActionCreator {
  static Action onAction() {
    return const Action(WeatherAction.action);
  }
}
