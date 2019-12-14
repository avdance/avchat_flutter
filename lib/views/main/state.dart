import 'package:avchat_flutter/routers/application.dart';
import 'package:avchat_flutter/routers/routes.dart';
import 'package:avchat_flutter/store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class MainState implements GlobalBaseState, Cloneable<MainState> {
  PageController controller;
  List tabData = [
    {'text': "消息", 'icon': Icon(Icons.chat_bubble_outline)},
    {'text': "联系人", 'icon': Icon(Icons.people_outline)},
    {'text': "发现", 'icon': Icon(Icons.wifi_tethering)},
    {'text': "我", 'icon': Icon(Icons.person_outline)},
  ];
  List<Widget> pages = [
    Application.router.buildPage(Routers.message, null),
    Application.router.buildPage(Routers.contacts, null),
    Application.router.buildPage(Routers.discover, null),
    Application.router.buildPage(Routers.profile, null)
  ];
  int currentIndex = 0;

  @override
  MainState clone() {
    return MainState()
      ..tabData = tabData
      ..controller = controller
      ..currentIndex = currentIndex
      ..pages = pages;
  }

  @override
  Color themeColor;
}

MainState initState(Map<String, dynamic> args) {
  final MainState state = new MainState();
  state.controller = new PageController();
  state.currentIndex = 0;
  return state;
}
