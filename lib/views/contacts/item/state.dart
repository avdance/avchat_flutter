import 'package:avchat_flutter/model/contact_item.dart';
import 'package:fish_redux/fish_redux.dart';

class ContactItemState implements Cloneable<ContactItemState> {

  ContactItemModel itemModel;

  ///外部设置给Item的数据
  ContactItemState({ContactItemModel model}){
    this.itemModel = model;
  }

  @override
  ContactItemState clone() {
    return ContactItemState()
    ..itemModel = itemModel;
  }
}

ContactItemState initState(Map<String, dynamic> args) {
  return ContactItemState();
}
