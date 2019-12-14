import 'package:avchat_flutter/model/user_manager.dart';
import 'package:fish_redux/fish_redux.dart';

class SplashState implements Cloneable<SplashState> {
  bool isLogined = false;

  @override
  SplashState clone() {
    return SplashState()..isLogined = isLogined;
  }
}

SplashState initState(Map<String, dynamic> args) {
  final SplashState stata = new SplashState();
  stata.isLogined = UserManage.getInstance().getUser() != null;
  return stata;
}
