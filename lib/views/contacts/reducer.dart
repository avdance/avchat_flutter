import 'package:fish_redux/fish_redux.dart';
import 'package:avchat_flutter/views/contacts/item/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<ContactsState> buildReducer() {
  return asReducer(
    <Object, Reducer<ContactsState>>{
      ContactsAction.onContactListInit: _onAction
    },
  );
}

ContactsState _onAction(ContactsState state, Action action) {
  final ContactsState newState = state.clone();
  final List<ContactItemState> _contacts =
      action.payload ?? <ContactItemState>[];
  newState.mData = _contacts;
  return newState;
}
