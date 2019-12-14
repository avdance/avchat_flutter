import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ContactsState> buildReducer() {
  return asReducer(
    <Object, Reducer<ContactsState>>{
      ContactsAction.action: _onAction,
    },
  );
}

ContactsState _onAction(ContactsState state, Action action) {
  final ContactsState newState = state.clone();
  return newState;
}
