import 'package:avchat_flutter/api/api.dart';
import 'package:avchat_flutter/api/base_response.dart';
import 'package:avchat_flutter/api/http_request.dart';
import 'package:avchat_flutter/main.dart';
import 'package:avchat_flutter/model/user.dart';
import 'package:avchat_flutter/model/user_manager.dart';
import 'package:avchat_flutter/routers/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.loginRequest: _onLoginRequest,
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
void _onLoginRequest(Action action, Context<LoginState> ctx) {
  Fluttertoast.showToast(msg: "登录");
  //直接请求即可.
  httpRequest.post(Api.LOGIN, data: {
    'user_name': '${ctx.state.nameUser}',
    'password': '${ctx.state.passWord}',
    'token': 'wangzhumo'
  }).then((response) => doLoginAction(response));
}

//登录事件.
doLoginAction(BaseResponse response) {
  //1.更新token
  HttpRequest.updateToken(response.getToken());
  //2.记录用户数据,写入数据库
  UserManage.getInstance().saveUser(User.fromJson(response.getData()));
  //3.跳转到首页
  Fluttertoast.showToast(msg: response.getMessage());
}
