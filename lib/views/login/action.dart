import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction { action,login }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  //跳转到自己的Action
  static Action onLogin() {
    return const Action(LoginAction.login);
  }
}
