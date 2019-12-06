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
    LoginAction.login: _onLogin
  });
}

void _onAction(Action action, Context<LoginState> ctx) {
  Fluttertoast.showToast(msg: "_onAction");
}

//处理onLogin事件
void _onLogin(Action action, Context<LoginState> ctx) {
  Fluttertoast.showToast(msg: "_onAction");
  Navigator.of(ctx.context).pushNamed('${Routers.home}', arguments: null);
}
