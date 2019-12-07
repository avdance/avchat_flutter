import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RegisterAction { next,register,password_error }

class RegisterActionCreator {
  static Action onNext() {
    return const Action(RegisterAction.next);
  }

  static Action onRegister() {
    return const Action(RegisterAction.register);
  }

  static Action onPwdError({bool flag = false}) {
    return Action(RegisterAction.password_error,payload: flag);
  }
}
