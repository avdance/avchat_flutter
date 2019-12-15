import 'package:avchat_flutter/views/message/item/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

export 'state.dart';

class MessageSessionComponent extends Component<SessionItemState> {
  MessageSessionComponent()
      : super(view: buildView, effect: buildEffect(), reducer: buildReducer());
}
