import 'package:fish_redux/fish_redux.dart';

enum ContactItemAction { action }

class ContactItemActionCreator {
  static Action onAction() {
    return const Action(ContactItemAction.action);
  }
}
