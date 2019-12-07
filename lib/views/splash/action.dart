import 'package:fish_redux/fish_redux.dart';

enum SplashAction { gone }

class SplashActionCreator {

  static Action onGone() {
    println("Splash --- SplashActionCreator  onGone");
    return const Action(SplashAction.gone);
  }
}
