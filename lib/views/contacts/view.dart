import 'package:avchat_flutter/widgets/index_bar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ContactsState state, Dispatch dispatch, ViewService viewService) {
  return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.redAccent)),
      child: IndexBarLayout());
}
