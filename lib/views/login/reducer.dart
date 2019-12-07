import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.password: _onPassword,
    },
  );
}

LoginState _onPassword(LoginState state, Action action) {
  println("buildReducer  _onPassword");
  final LoginState newState = state.clone();
  newState.isShowPwd = !newState.isShowPwd;
  return newState;
}
