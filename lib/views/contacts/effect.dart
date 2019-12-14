import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ContactsState> buildEffect() {
  return combineEffects(<Object, Effect<ContactsState>>{
    ContactsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ContactsState> ctx) {
}
