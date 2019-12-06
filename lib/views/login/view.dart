import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Container(
        child: Center(
          child: RaisedButton(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              color: Colors.green,
              child: Text(
                "进入",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                //todo 点击事件
                Fluttertoast.showToast(msg: "点击事件");
              }),
        )
    ),
  );
}
