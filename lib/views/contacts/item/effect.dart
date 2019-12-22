import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ContactItemState> buildEffect() {
  return combineEffects(<Object, Effect<ContactItemState>>{
    ContactItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ContactItemState> ctx) {
}
