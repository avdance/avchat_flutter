import 'package:avchat_flutter/views/message/adapter/adapter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MessagePage extends Page<MessageState, Map<String, dynamic>> {
  MessagePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MessageState>(
              adapter: NoneConn<MessageState>() + SessionAdapter(),
              slots: <String, Dependent<MessageState>>{}),
          middleware: <Middleware<MessageState>>[],
        );
}
