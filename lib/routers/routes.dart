import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:avchat_flutter/routers/router_handlers.dart';

class Routers{

  static String root = "/";
  static String home = "/home";



  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print("ROUTER NOT FIND!");
      });

    router.define(root,handler:splashHandler);
  }
}