import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(SplashState state, Dispatch dispatch, ViewService viewService) {
  println("Splash --- buildView");
  return new Scaffold(
    body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_splash_image.webp"),
              fit: BoxFit.cover)),
      child: Container(
        child: Center(
          child: Container(
            height: 80.0,
            width: 80.0,
            child: Image.asset("assets/images/ic_app_logo.webp"),
          ),
        ),
      ),
    ),
  );
}
