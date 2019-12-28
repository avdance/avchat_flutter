import 'package:fish_redux/fish_redux.dart';

class AddFriendState implements Cloneable<AddFriendState> {

  @override
  AddFriendState clone() {
    return AddFriendState();
  }
}

AddFriendState initState(Map<String, dynamic> args) {
  return AddFriendState();
}
