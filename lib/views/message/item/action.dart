import 'package:avchat_flutter/views/message/state.dart';
import 'package:fish_redux/fish_redux.dart';

enum SessionAction { add, remove, update }

class SessionActionCreator {
  static Action add(MessageState state) {
    return Action(SessionAction.add, payload: state);
  }

  static Action remove(MessageState state) {
    return Action(SessionAction.remove, payload: state);
  }

  static Action update(MessageState state) {
    return Action(SessionAction.update, payload: state);
  }
}
