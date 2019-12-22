import 'package:fish_redux/fish_redux.dart';

class ContactItemState implements Cloneable<ContactItemState> {

  @override
  ContactItemState clone() {
    return ContactItemState();
  }
}

ContactItemState initState(Map<String, dynamic> args) {
  return ContactItemState();
}
