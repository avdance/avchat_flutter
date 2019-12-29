import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AddFriendState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2.0)),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              centerTitle: false,
              forceElevated: true,
              titleSpacing: 0.0,
              pinned: false,
              title: Text("添加朋友",
                  style: TextStyle(color: Colors.black))
          ),
          SliverFillRemaining(
            child: Center(child: Text('FillRemaining', style: TextStyle(fontSize: 30.0))),
          )
        ],
      ),
    ),
  );
}
