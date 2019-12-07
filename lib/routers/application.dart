import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

class Application{
  static AbstractRoutes router;


  static MaterialPageRoute<Object> generateRoute(RouteSettings settings){
    return MaterialPageRoute<Object>(builder: (BuildContext context) {
      return router.buildPage(settings.name, settings.arguments);
    });
  }
}