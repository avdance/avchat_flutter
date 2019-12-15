import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../item/component.dart';
import 'reducer.dart';

class SessionAdapter extends SourceFlowAdapter<MessageState> {
  SessionAdapter()
      : super(pool: <String, Component<Object>>{
          'session': MessageSessionComponent()
        }, reducer: buildReducer());
}
