import 'package:avchat_flutter/views/message/item/state.dart';
import 'package:fish_redux/fish_redux.dart';
import '../item/component.dart';

enum SessionListAction { add }

class SessionListActionCreator {
  static Action add(SessionItemState state) {
    return Action(SessionListAction.add, payload: state);
  }
}
