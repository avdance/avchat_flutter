import 'package:avchat_flutter/views/message/item/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MessageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MessageState>>{
      MessageAction.initSessionList: _onInitSessionList,
    },
  );
}

///第一次获取到数据
MessageState _onInitSessionList(MessageState state, Action action) {
  final MessageState newState = state.clone();
  final List<SessionItemState> _sessions =
      action.payload ?? <SessionItemState>[];
  newState.sessionStateList = _sessions;
  return newState;
}
