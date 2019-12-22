import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ContactItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ContactItemState>>{
      ContactItemAction.action: _onAction,
    },
  );
}

ContactItemState _onAction(ContactItemState state, Action action) {
  final ContactItemState newState = state.clone();
  return newState;
}
