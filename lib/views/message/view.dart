import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MessageState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text(
        state.getUnReadTitle(),
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            color: Colors.black,
          ),
          onPressed: () => dispatch(MessageActionCreator.onActionAdd()),
        )
      ],
    ),
    body: Container(
      child: ListView.builder(
        itemBuilder: adapter.itemBuilder,
        itemCount: adapter.itemCount,
      ),
    ),
  );
}
