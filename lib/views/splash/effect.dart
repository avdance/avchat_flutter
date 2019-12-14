import 'dart:async';

import 'package:avchat_flutter/routers/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    Lifecycle.initState: _onInit,
    SplashAction.gone: _onGone,
  });
}

void _onInit(Action action, Context<SplashState> ctx) {
  println("Splash --- buildEffect  _onInit");
  Fluttertoast.showToast(msg: "初始化/获取权限", toastLength: Toast.LENGTH_SHORT);
  ctx.dispatch(SplashActionCreator.onGone());
}

void _onGone(Action action, Context<SplashState> ctx) {
  println("Splash --- buildEffect  _onGone");
  Future.delayed(const Duration(milliseconds: 2000)).whenComplete(() {
    Fluttertoast.showToast(msg: "进入下一页");
    if (ctx.state.isLogined) {
      Navigator.of(ctx.context).pushNamed('${Routers.main}', arguments: null);
    } else {
      Navigator.of(ctx.context).pushNamed('${Routers.login}', arguments: null);
    }
  });
}
