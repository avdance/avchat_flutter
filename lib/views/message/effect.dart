import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MessageState> buildEffect() {
  return combineEffects(<Object, Effect<MessageState>>{
    MessageAction.action: _onActionAdd,
  });
}

void _onActionAdd(Action action, Context<MessageState> ctx) {}
