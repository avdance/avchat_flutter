import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<SessionItemState> buildEffect() {
  return combineEffects(<Object, Effect<SessionItemState>>{});
}
