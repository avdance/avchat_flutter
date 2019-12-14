import 'package:avchat_flutter/utils/text_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.password: _onPassword,
      LoginAction.login: _onLogin,
    },
  );
}

LoginState _onPassword(LoginState state, Action action) {
  println("buildReducer  _onPassword");
  final LoginState newState = state.clone();
  newState.isShowPwd = !newState.isShowPwd;
  return newState;
}

LoginState _onLogin(LoginState state, Action action) {
  final LoginState newState = state.clone();
  newState.isCompleteInput = false;
  //获取用户数据
  newState.nameUser = newState.nameEditController.value.text;
  if (TextUtils.isEmpty(newState.nameUser)) {
    if(action.payload as bool){
      Fluttertoast.showToast(msg: "请填写用户名");
      newState.focusNodePwd.unfocus();
      newState.focusNodeName.requestFocus();
    }
    return newState;
  }
  newState.passWord = newState.pwdEditController.value.text;
  if (TextUtils.isEmpty(newState.passWord)) {
    if(action.payload as bool){
      Fluttertoast.showToast(msg: "请填写密码");
      newState.focusNodePwd.requestFocus();
      newState.focusNodeName.unfocus();
    }
    return newState;
  }
  newState.isCompleteInput = true;
  return newState;
}
