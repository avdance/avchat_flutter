import 'package:fish_redux/fish_redux.dart';

enum AddFriendAction { action }

class AddFriendActionCreator {
  static Action onAction() {
    return const Action(AddFriendAction.action);
  }
}
