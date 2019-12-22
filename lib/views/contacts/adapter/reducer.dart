import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../item/action.dart' as contact_action;
import 'action.dart';

Reducer<ContactsState> buildReducer() {
  return asReducer(<Object, Reducer<ContactsState>>{
    ContactListAction.send: _send
  });
}

ContactsState _send(ContactsState state, Action action) {
  final ContactsState toDo = action.payload;
  return state.clone();
}


