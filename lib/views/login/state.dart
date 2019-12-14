import 'package:avchat_flutter/store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

class LoginState implements GlobalBaseState,Cloneable<LoginState> {

  TextEditingController nameEditController;
  TextEditingController pwdEditController;

  FocusNode focusNodeName;
  FocusNode focusNodePwd;

  bool isShowPwd;
  bool isCompleteInput;

  String nameUser;
  String passWord;

  @override
  Color themeColor;

  @override
  LoginState clone() {
    return LoginState()
    ..nameEditController = nameEditController
    ..pwdEditController = pwdEditController
    ..focusNodeName = focusNodeName
    ..focusNodePwd = focusNodePwd
    ..isCompleteInput = isCompleteInput
    ..nameUser = nameUser
    ..passWord = passWord
    ..isShowPwd = isShowPwd;
  }


}

LoginState initState(Map<String, dynamic> args) {
  final LoginState state = LoginState();
  state.nameEditController = TextEditingController();
  state.pwdEditController = TextEditingController();
  state.focusNodeName = FocusNode();
  state.focusNodePwd = FocusNode();
  state.isShowPwd = true;
  state.nameUser = null;
  state.passWord = null;
  state.isCompleteInput = false;
  return state;
}
