import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Reducer<SplashState> buildReducer() {
  return asReducer(
    <Object, Reducer<SplashState>>{
      SplashAction.init: _onInit,
      SplashAction.gone: _onGone
    },
  );
}

SplashState _onInit(SplashState state, Action action) {
  println("Splash --- buildReducer  _onInit");
  final SplashState newState = state.clone();
  return newState;
}

SplashState _onGone(SplashState state, Action action) {
  println("Splash --- buildReducer  _onGone");
  final SplashState newState = state.clone();
  return newState;
}
