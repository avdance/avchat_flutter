import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../item/action.dart' as session_action;
import 'action.dart';

Reducer<MessageState> buildReducer() {
  return asReducer(<Object, Reducer<MessageState>>{
    SessionListAction.add: _add,
    session_action.SessionAction.remove: _remove
  });
}

MessageState _add(MessageState state, Action action) {
  final MessageState toDo = action.payload;
  return state.clone();
}

MessageState _remove(MessageState state, Action action) {
  final String unique = action.payload;
  return state.clone();
}
