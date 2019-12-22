import 'package:fish_redux/fish_redux.dart';

import 'item/state.dart';


enum ContactsAction { onContactListInit }

class ContactsActionCreator {
  static Action onContactListInit(List<ContactItemState> lists) {
    return Action(ContactsAction.onContactListInit,payload: lists);
  }
}
