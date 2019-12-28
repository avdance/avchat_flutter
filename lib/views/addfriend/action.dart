import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AddFriendAction { action }

class AddFriendActionCreator {
  static Action onAction() {
    return const Action(AddFriendAction.action);
  }
}
