import 'dart:async';

import 'package:fish_redux/fish_redux.dart';

class SplashState implements Cloneable<SplashState> {

  @override
  SplashState clone() {
    println("Splash --- SplashState  clone");
    return SplashState();
  }
}

SplashState initState(Map<String, dynamic> args) {
  println("Splash --- SplashState  initState");
  return SplashState();
}

