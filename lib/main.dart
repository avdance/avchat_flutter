import 'package:avchat_flutter/event/event_bus.dart';
import 'package:avchat_flutter/model/user_manager.dart';
import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'utils/shared_preferences.dart';
import 'routers/routes.dart';
import 'routers/application.dart' show Application;

SpUtil sharepre;

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routers.configureRoutes(router);
    //set application
    Application.router = router;
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

//create state
class _MyAppState extends State<MyApp> {
  bool _isFirstOpen = true;
  int mainColor = 0xFF48B6FF;

  _MyAppState() {
    final eventBus = new EventBus();
    ApplicationEvent.event = eventBus;
  }

  @override
  void initState() {
    super.initState();

    //初始化自己的一些其他东西
    _initSomethings();

    //一些属性
    //_isFirstOpen = sharepre.getBool(SharedPreferencesKeys.IS_FIRST_SHOW);

    //添加event的监听
    ApplicationEvent.event.on().listen((event) {
      print("Receive，event = $event");
    });
  }

  showSplashPage() {
    if (_isFirstOpen) {
      return Container(
        child: Center(
          child: Container(height: 80.0,width: 80.0,child: Image.asset("assets/images/ic_app_logo.webp"),),
        ),
      );
    } else {
      //如果已经进入过，那么看这个人是否已经登录过了。
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "AVChat",
      theme: new ThemeData(
          primaryColor: Color(mainColor),
          backgroundColor: Colors.white,
          accentColor: Color(0xFF888888),
          textTheme: TextTheme(
              //default theme
              body1: TextStyle(color: Colors.black, fontSize: 16.0)),
          iconTheme: IconThemeData(color: Color(mainColor), size: 35.0)),
      home: new Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg_splash_image.webp"),
                  fit: BoxFit.cover)),
          child: showSplashPage(),
        ),
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}

void _initSomethings() async {
  //init something
}

void main() async {
  //init sharepreferences
  sharepre = await SpUtil.getInstance();
  runApp(new MyApp());
}
