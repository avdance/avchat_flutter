import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: PageView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        //创建一些View,作为tab页面
      ],
      controller: state.controller,
      onPageChanged: (int index) =>
          dispatch(MainActionCreator.onChangeTab(index)),
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: state.themeColor,
      items: <BottomNavigationBarItem>[

      ],
    ),
  );
}
