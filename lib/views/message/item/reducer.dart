import 'package:avchat_flutter/views/message/item/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'state.dart';
import 'action.dart';

Reducer<SessionItemState> buildReducer() {
  return asReducer(<Object, Reducer<SessionItemState>>{
    SessionAction.add: _onAdd,
    SessionAction.remove: _onRemove,
    SessionAction.update: _onUpdate
  });
}

SessionItemState _onAdd(SessionItemState state, Action action) {
  return state.clone();
}

SessionItemState _onRemove(SessionItemState state, Action action) {
  return state.clone();
}

SessionItemState _onUpdate(SessionItemState state, Action action) {
  return state.clone();
}
