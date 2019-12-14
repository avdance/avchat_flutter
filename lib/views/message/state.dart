import 'package:fish_redux/fish_redux.dart';

class MessageState implements Cloneable<MessageState> {
  int unReadSessionNumber = 0;

  @override
  MessageState clone() {
    return MessageState();
  }

  String getUnReadTitle() {
    if (unReadSessionNumber <= 0) {
      return "消息";
    } else {
      if (unReadSessionNumber > 99) {
        return "消息(99+)";
      }
      return '消息($unReadSessionNumber)';
    }
  }
}

MessageState initState(Map<String, dynamic> args) {
  return MessageState();
}
