import 'package:fish_redux/fish_redux.dart';

class ContactsState extends MutableSource implements Cloneable<ContactsState> {

  @override
  ContactsState clone() {
    return ContactsState();
  }

  @override
  Object getItemData(int index) {
    // TODO: implement getItemData
    return null;
  }

  @override
  String getItemType(int index) {
    // TODO: implement getItemType
    return null;
  }

  @override
  // TODO: implement itemCount
  int get itemCount => null;

  @override
  void setItemData(int index, Object data) {
    // TODO: implement setItemData
  }
}

ContactsState initState(Map<String, dynamic> args) {
  return ContactsState();
}
