import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.clearUsername: _clearUsername,
      LoginAction.clearPwd: _clearPwd,
    },
  );
}

LoginState _clearUsername(LoginState state, Action action) {
  final LoginState newState = state.clone();
  newState.usernameController.clear();
  return newState;
}
LoginState _clearPwd(LoginState state, Action action) {
  final LoginState newState = state.clone();
  newState.passwdController.clear();
  return newState;
}
