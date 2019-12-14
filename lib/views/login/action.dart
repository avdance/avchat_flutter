import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction { action, login,loginRequest, register, password }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onRegister() {
    return const Action(LoginAction.register);
  }

  static Action onPassword() {
    return const Action(LoginAction.password);
  }

  //跳转到自己的Action
  static Action onLogin({bool isClick = false}) {
    return Action(LoginAction.login,payload: isClick);
  }

  static Action onLoginRequest() {
    return const Action(LoginAction.loginRequest);
  }
}
