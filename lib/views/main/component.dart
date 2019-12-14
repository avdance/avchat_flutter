import 'package:avchat_flutter/views/main/state.dart';
import 'package:avchat_flutter/views/main/view.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

class MainComponentState extends ComponentState<MainState>
    with SingleTickerProviderStateMixin {

}

class MainComponent extends Component<MainState> {
  @override
  ComponentState<MainState> createState() {
    return MainComponentState();
  }
}
