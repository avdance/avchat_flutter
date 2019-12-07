import 'package:avchat_flutter/model/user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class RegisterState implements Cloneable<RegisterState> {

  TextEditingController phoneEditController;
  TextEditingController pwdEditController;
  TextEditingController pwd2EditController;
  TextEditingController nickEditController;
  TextEditingController nameEditController;

  FocusNode focusNodeName;
  FocusNode focusNodePhone;
  FocusNode focusNodePwd;
  FocusNode focusNodePwd2;
  FocusNode focusNodeNick;
  PageController controller;
  User userInfo;
  bool isPasswordSuccess;

  @override
  RegisterState clone() {
    return RegisterState()
    ..phoneEditController = phoneEditController
    ..nameEditController = nameEditController
    ..pwdEditController = pwdEditController
    ..pwd2EditController = pwd2EditController
    ..nickEditController = nickEditController
    ..focusNodeName = focusNodeName
    ..focusNodePwd = focusNodePwd
    ..focusNodePwd2 = focusNodePwd2
    ..focusNodePhone = focusNodePhone
    ..focusNodeNick = focusNodeNick
    ..controller = controller
    ..isPasswordSuccess = isPasswordSuccess
    ..userInfo = userInfo;
  }
}

RegisterState initState(Map<String, dynamic> args) {
  final state = RegisterState();
  state.controller = PageController();
  state.userInfo = User(0);
  state.nameEditController = TextEditingController();
  state.pwdEditController = TextEditingController();
  state.pwd2EditController = TextEditingController();
  state.phoneEditController = TextEditingController();
  state.nickEditController = TextEditingController();
  state.focusNodeName = FocusNode();
  state.focusNodePwd = FocusNode();
  state.focusNodePwd2 = FocusNode();
  state.focusNodePhone = FocusNode();
  state.focusNodeNick = FocusNode();
  state.isPasswordSuccess = false;
  return state;
}
