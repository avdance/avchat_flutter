import 'package:fish_redux/fish_redux.dart';
import 'package:avchat_flutter/views/contacts/item/state.dart';

class ContactsState extends MutableSource implements Cloneable<ContactsState> {
  List<ContactItemState> mData;

  @override
  ContactsState clone() {
    return ContactsState();
  }

  @override
  Object getItemData(int index) {
    return mData[index];
  }

  @override
  String getItemType(int index) {
    if (mData[index].itemModel.isTitle) {
      return "title";
    }
    return "item";
  }

  @override
  int get itemCount => mData?.length ?? 0;

  @override
  void setItemData(int index, Object data) {
    mData[index] = data;
  }
}

ContactsState initState(Map<String, dynamic> args) {
  return ContactsState();
}
