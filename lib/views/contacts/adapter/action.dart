import 'package:avchat_flutter/model/contact_item.dart';
import 'package:fish_redux/fish_redux.dart';


enum ContactListAction { send }

class ContactListActionCreator {
  static Action add(ContactItemModel state) {
    return Action(ContactListAction.send, payload: state);
  }
}
