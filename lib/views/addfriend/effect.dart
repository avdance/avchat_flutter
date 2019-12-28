import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AddFriendState> buildEffect() {
  return combineEffects(<Object, Effect<AddFriendState>>{
    AddFriendAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AddFriendState> ctx) {
}
