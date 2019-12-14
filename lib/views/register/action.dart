import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RegisterAction { previous,next,register,password_error,backlogin }

class RegisterActionCreator {
  static Action onNext() {
    return const Action(RegisterAction.next);
  }

  static Action onBackLogin() {
    return const Action(RegisterAction.backlogin);
  }

  static Action onPrevious() {
    return const Action(RegisterAction.previous);
  }

  static Action onRegister() {
    return const Action(RegisterAction.register);
  }

  static Action onPwdError({bool flag = false}) {
    return Action(RegisterAction.password_error,payload: flag);
  }
}
