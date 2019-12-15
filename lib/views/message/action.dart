import 'package:fish_redux/fish_redux.dart';
import 'item/component.dart';

enum MessageAction { initSessionList, addaction }

class MessageActionCreator {
  static Action onInitSessionList(List<SessionItemState> list) {
    return Action(MessageAction.initSessionList, payload: list);
  }

  static Action onActionAdd() {
    return const Action(MessageAction.addaction);
  }
}
