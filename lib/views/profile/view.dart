import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ProfileState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    alignment: Alignment.center,
    child: Text("ProfilePage"),
  );
}
