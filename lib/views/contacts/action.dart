import 'package:fish_redux/fish_redux.dart';

import 'item/state.dart';


enum ContactsAction { onContactListInit,addFriend }

class ContactsActionCreator {
  static Action onContactListInit(List<ContactItemState> lists) {
    return Action(ContactsAction.onContactListInit,payload: lists);
  }

  static Action onAddFriend() {
    return Action(ContactsAction.addFriend);
  }
}
