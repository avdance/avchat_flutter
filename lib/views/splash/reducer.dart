import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SplashState> buildReducer() {
  return asReducer(
    <Object, Reducer<SplashState>>{
      SplashAction.gone: _onGone
    },
  );
}


SplashState _onGone(SplashState state, Action action) {
  println("Splash --- buildReducer  _onGone");
  final SplashState newState = state.clone();
  return newState;
}
