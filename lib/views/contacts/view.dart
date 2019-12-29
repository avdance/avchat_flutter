import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';


import 'state.dart';

Widget buildView(
    ContactsState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          "联系人",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () => {}),
          IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.black,
              ),
              onPressed: () => {})
        ]),
    body: Container(
        child: ListView.builder(
          itemBuilder: adapter.itemBuilder,
          itemCount: adapter.itemCount,
        )),
  );
}
