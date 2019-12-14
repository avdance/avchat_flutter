import 'package:fish_redux/fish_redux.dart';

enum MessageAction { action }

class MessageActionCreator {
  static Action onActionAdd() {
    return const Action(MessageAction.action);
  }
}
