import 'package:avchat_flutter/api/api.dart';
import 'package:avchat_flutter/main.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    RegisterAction.register: _onRegister
  });
}

void _onRegister(Action action, Context<RegisterState> ctx) {
  //判断这里的
  //1.请求接口.
  //2.返回数据.
  //3.相应布局.
  var user = ctx.state.userInfo;
  httpRequest.post(Api.REGISTER,data: {'user_name':'${user.userName}','password':'${user.password}','nice_name':'${user.niceName}','mobile':'${user.phone}'}).then((value) =>{
    println(value.toString())
  });
}

