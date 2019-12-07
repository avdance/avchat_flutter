import 'package:fish_redux/fish_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
}

