import 'package:fish_redux/fish_redux.dart';

enum LoginAction { 
  login,
  clearUsername,
  clearPwd
 }

class LoginActionCreator {
  static Action onLogin() {
    return const Action(LoginAction.login);
  }

  static Action onClearUsername() {
    return const Action(LoginAction.clearUsername);
  }

  static Action onClearPwd() {
    return const Action(LoginAction.clearPwd);
  }
}
