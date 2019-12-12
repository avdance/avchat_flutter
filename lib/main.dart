import 'package:avchat_flutter/api/http_request.dart';
import 'package:avchat_flutter/event/event_bus.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'utils/shared_preferences.dart';
import 'routers/routes.dart';
import 'routers/application.dart' show Application;

SpUtil sharepre;
HttpRequest httpRequest;

class MyApp extends StatefulWidget {
  MyApp() {
    var configure = Routers.configureRoutes();
    //set application
    Application.router = configure;
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

//create state
class _MyAppState extends State<MyApp> {
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

    //添加event的监听
    ApplicationEvent.event.on().listen((event) {
      print("Receive，event = $event");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AVChat",
      theme: new ThemeData(
          primaryColor: Color(mainColor),
          backgroundColor: Colors.white,
          accentColor: Color(0xFF888888),
          textTheme: TextTheme(
              //default theme
              body1: TextStyle(color: Colors.black, fontSize: 16.0)),
          iconTheme: IconThemeData(color: Color(mainColor), size: 35.0)),
      home: Application.router.buildPage(Routers.splash, null),
      onGenerateRoute: (RouteSettings settings) =>
          Application.generateRoute(settings),
    );
  }
}

void _initSomethings() async {
  //init something
}

void main() async {
  //TestWidgetsFlutterBinding.ensureInitialized();
  //init sharepreferences
  sharepre = await SpUtil.getInstance();
  httpRequest = HttpRequest();
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}
