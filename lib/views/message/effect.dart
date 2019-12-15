import 'package:avchat_flutter/model/session.dart';
import 'package:avchat_flutter/views/message/item/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MessageState> buildEffect() {
  return combineEffects(
      <Object, Effect<MessageState>>{Lifecycle.initState: _initSession});
}

void _initSession(Action action, Context<MessageState> ctx) {
  //创建新的数据
  final List<SessionItemState> initSessions = <SessionItemState>[
    SessionItemState(
        session: MessageSession("0",
            from_avatar: "https://wangzhumo.com/img/avatar.png",
            from_nick: "wangzhumo",
            from_uid: "3",
            unread: 12,
            last_time: 1576381507860,
            last_chat: "吃屎吧你 -- 001")),
    SessionItemState(
        session: MessageSession("1",
            from_avatar: "https://wangzhumo.com/img/android.png",
            from_nick: "android",
            from_uid: "4",
            unread: 0,
            last_time: 1576381507860,
            last_chat: "吃屎吧你 -- 002")),
  ];

  ctx.dispatch(MessageActionCreator.onInitSessionList(initSessions));
}
