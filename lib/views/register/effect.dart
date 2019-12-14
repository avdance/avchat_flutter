import 'package:avchat_flutter/api/api.dart';
import 'package:avchat_flutter/api/base_response.dart';
import 'package:avchat_flutter/main.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(
      <Object, Effect<RegisterState>>{RegisterAction.register: _onRegister,
        RegisterAction.backlogin: _onBackLogin});
}

void _onBackLogin(Action action, Context<RegisterState> ctx){
  Navigator.pop(ctx.context, null);
}

void _onRegister(Action action, Context<RegisterState> ctx) {
  //判断这里的
  //1.请求接口.
  //2.返回数据.
  //3.相应布局.
  var user = ctx.state.userInfo;
  httpRequest.post(Api.REGISTER, data: {
    'user_name': '${user.userName}',
    'password': '${user.password}',
    'nice_name': '${user.niceName}',
    'mobile': '${user.phone}',
    'token': 'wangzhumo'
  }).then((response) => dispatchResponse(ctx, response));
}

void dispatchResponse(Context<RegisterState> ctx, BaseResponse response) {
  if (response.isSuccessful()) {
    //如果成功,则提示注册成功
    Fluttertoast.showToast(msg: response.getMessage());
    //跳转到登录页面.
    Navigator.pop(ctx.context, null);
  } else {
    //如果失败了,应该返回刚才的页面继续填写.
    Fluttertoast.showToast(msg: response.getMessage());
    ctx.dispatch(RegisterActionCreator.onPrevious());
  }
}
