import 'package:avchat_flutter/views/message/item/state.dart';
import 'package:fish_redux/fish_redux.dart';

class MessageState extends MutableSource implements Cloneable<MessageState> {
  int unReadSessionNumber = 0;

  //数据源
  List<SessionItemState> sessionStateList;

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

  @override
  Object getItemData(int index) {
    return sessionStateList[index];
  }

  @override
  String getItemType(int index) {
    return "session";
  }

  @override
  int get itemCount => sessionStateList?.length ?? 0;

  @override
  void setItemData(int index, Object data) {
    sessionStateList[index] = data;
  }
}

MessageState initState(Map<String, dynamic> args) {
  return MessageState();
}
