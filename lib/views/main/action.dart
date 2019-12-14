import 'package:fish_redux/fish_redux.dart';

enum MainAction { action,changeTab }

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }


  ///用于切换页数
  static Action onChangeTab(int index) {
    return Action(MainAction.changeTab,payload: index);
  }
}
