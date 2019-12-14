import 'package:avchat_flutter/widgets/keepalive_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: PageView(
      physics: ClampingScrollPhysics(),
      children: state.pages.map(buildKeepPage).toList(),
      controller: state.controller,
      onPageChanged: (int index) =>
          dispatch(MainActionCreator.onChangeTab(index)),
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.white,
      items: buildItemTabs(state.tabData),
      currentIndex: state.currentIndex,
      selectedItemColor: state.themeColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) => state.controller.jumpToPage(index),
      type: BottomNavigationBarType.fixed,
    ),
  );
}

List<BottomNavigationBarItem> buildItemTabs(List tabData) {
  List<BottomNavigationBarItem> _tabs = List.generate(
      tabData.length,
      (index) => BottomNavigationBarItem(
          icon: tabData[index]['icon'], title: Text(tabData[index]['text'])));
  return _tabs;
}

Widget buildKeepPage(Widget page) {
  return KeepAliveWidget(page);
}
