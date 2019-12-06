import 'package:fish_redux/fish_redux.dart';

///更换主题颜色
enum GlobalAction { changeThemeColor }

class GlobalActionCreator {
  static Action onChangeThemeColor() {
    return const Action(GlobalAction.changeThemeColor);
  }
}
