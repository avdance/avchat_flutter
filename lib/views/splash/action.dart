import 'package:fish_redux/fish_redux.dart';

enum SplashAction { init,gone }

class SplashActionCreator {
  static Action onInit() {
    println("Splash --- SplashActionCreator  onInit");
    return const Action(SplashAction.init);
  }

  static Action onGone() {
    println("Splash --- SplashActionCreator  onGone");
    return const Action(SplashAction.gone);
  }
}
