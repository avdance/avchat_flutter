import 'package:avchat_flutter/routers/application.dart';
import 'package:avchat_flutter/routers/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.login: _onLogin,
    LoginAction.register: _onRegister
  });
}

void _onAction(Action action, Context<LoginState> ctx) {
  Fluttertoast.showToast(msg: "暂未启用");
}

void _onRegister(Action action, Context<LoginState> ctx) {
  Fluttertoast.showToast(msg: "注册账号");
  Navigator.of(ctx.context).pushNamed('${Routers.register}', arguments: null);
}

//处理onLogin事件
void _onLogin(Action action, Context<LoginState> ctx) {
  Fluttertoast.showToast(msg: "登录");
}
