import 'package:avchat_flutter/utils/text_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Reducer<RegisterState> buildReducer() {
  return asReducer(
    <Object, Reducer<RegisterState>>{
      RegisterAction.next: _onContinues,
      RegisterAction.password_error: _onPwdError
    },
  );
}

RegisterState _onContinues(RegisterState state, Action action) {
  final RegisterState newState = state.clone();
  //获取用户数据
  newState.userInfo.userName = newState.nameEditController.value.text;
  println("User = ${newState.userInfo.toJson()}");
  if (TextUtils.isEmpty(newState.userInfo.userName)) {
    Fluttertoast.showToast(msg: "请填写用户名");
    newState.nameEditController.clear();
    newState.focusNodeName.requestFocus();
    newState.focusNodeNick.unfocus();
    newState.focusNodePhone.unfocus();
    return newState;
  }
  newState.userInfo.niceName = newState.nickEditController.value.text;
  println("User = ${newState.userInfo.toJson()}");
  if (TextUtils.isEmpty(newState.userInfo.niceName)) {
    Fluttertoast.showToast(msg: "请填写昵称");
    newState.nickEditController.clear();
    newState.focusNodeName.unfocus();
    newState.focusNodeNick.requestFocus();
    newState.focusNodePhone.unfocus();
    return newState;
  }
  newState.userInfo.phone = newState.phoneEditController.value.text;
  println("User = ${newState.userInfo.toJson()}");
  if (TextUtils.isEmpty(newState.userInfo.phone)) {
    Fluttertoast.showToast(msg: "请填写手机号");
    newState.phoneEditController.clear();
    newState.focusNodePhone.requestFocus();
    newState.focusNodeNick.unfocus();
    newState.focusNodeName.unfocus();
    return newState;
  }
  newState.controller.jumpToPage(1);
  return newState;
}

RegisterState _onPwdError(RegisterState state, Action action) {
  final RegisterState newState = state.clone();
  newState.isPasswordSuccess = false;
  //获取用户数据
  newState.userInfo.password = newState.pwdEditController.value.text;
  println("User = ${newState.userInfo.toJson()}");
  if (TextUtils.isEmpty(newState.userInfo.password)) {
    if (action.payload as bool) {
      Fluttertoast.showToast(msg: "请填写密码");
      newState.focusNodePwd.requestFocus();
      newState.focusNodePwd2.unfocus();
    }
    return newState;
  }
  var password2 = newState.pwd2EditController.value.text;
  println("User = ${newState.userInfo.toJson()}");
  if (TextUtils.isEmpty(password2)) {
    if (action.payload as bool) {
      Fluttertoast.showToast(msg: "请确认密码");
      newState.focusNodePwd.unfocus();
      newState.focusNodePwd2.requestFocus();
    }
    return newState;
  }
  //对比密码
  if (!TextUtils.equals(newState.userInfo.password, password2)) {
    if (action.payload as bool) {
      Fluttertoast.showToast(msg: "两次密码不一致");
    }
    return newState;
  }
  newState.isPasswordSuccess = true;
  return newState;
}
