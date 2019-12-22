import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ContactItemAction { action }

class ContactItemActionCreator {
  static Action onAction() {
    return const Action(ContactItemAction.action);
  }
}
