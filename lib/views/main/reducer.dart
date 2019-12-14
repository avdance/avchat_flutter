import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.action: _onAction,
      MainAction.changeTab: _onChangeTab
    },
  );
}

MainState _onAction(MainState state, Action action) {
  final MainState newState = state.clone();
  return newState;
}

MainState _onChangeTab(MainState state, Action action) {
  final MainState newState = state.clone();
  //这是刚刚切换到的Page
  int pageIndex = action.payload ?? 0;
  newState.currentIndex = pageIndex;
  return newState;
}
