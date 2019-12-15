import 'package:avchat_flutter/model/session.dart';
import 'package:fish_redux/fish_redux.dart';

///Session的Item
class SessionItemState implements Cloneable<SessionItemState> {
  MessageSession session;

  SessionItemState({MessageSession session}) {
    this.session = session;
  }

  @override
  SessionItemState clone() {
    return SessionItemState()..session = session;
  }
}
