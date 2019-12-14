import 'package:fish_redux/fish_redux.dart';

class ContactsState implements Cloneable<ContactsState> {

  @override
  ContactsState clone() {
    return ContactsState();
  }
}

ContactsState initState(Map<String, dynamic> args) {
  return ContactsState();
}
