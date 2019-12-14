import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ContactsAction { action }

class ContactsActionCreator {
  static Action onAction() {
    return const Action(ContactsAction.action);
  }
}
