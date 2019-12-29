import 'package:avchat_flutter/model/contact_item.dart';
import 'package:avchat_flutter/routers/routes.dart';
import 'package:avchat_flutter/views/contacts/item/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<ContactsState> buildEffect() {
  return combineEffects(<Object, Effect<ContactsState>>{
    Lifecycle.initState: _initContact,
    ContactsAction.addFriend: _onAddFriend
  });
}


///跳转到添加好友页面
void _onAddFriend(Action action, Context<ContactsState> ctx){
  //直接跳转
  Navigator.of(ctx.context).pushNamed(Routers.add_friends);
}

///获取数据
void _initContact(Action action, Context<ContactsState> ctx) {
  final List<ContactItemState> initContact = new List<ContactItemState>();
  //几个固定的Item
  ContactItemModel model20 = ContactItemModel(20);
  model20.isTitle = true;
  model20.label = "Android";

  ContactItemModel model = ContactItemModel(11);
  model.isDiv = false;
  model.niceName = "android";
  model.headerImage = "https://wangzhumo.com/img/android.png";

  ContactItemModel model2 = ContactItemModel(12);
  model2.niceName = "media";
  model2.headerImage = "https://wangzhumo.com/img/media.png";


  ContactItemModel model21 = ContactItemModel(21);
  model21.isTitle = true;
  model21.label = "音视频";

  ContactItemModel model3 = ContactItemModel(12);
  model3.isDiv = false;
  model3.niceName = "coding";
  model3.headerImage = "https://wangzhumo.com/img/coding.png";

  ContactItemModel model4 = ContactItemModel(14);
  model4.niceName = "camera";
  model4.headerImage = "https://wangzhumo.com/img/camera.png";


  ContactItemModel model22 = ContactItemModel(22);
  model22.isTitle = true;
  model22.label = "FFmpeg";

  ContactItemModel model5 = ContactItemModel(15);
  model5.isDiv = false;
  model5.niceName = "ffmpeg";
  model5.headerImage = "https://wangzhumo.com/img/ffmpeg.png";

  initContact.add(ContactItemState(model: model20));
  initContact.add(ContactItemState(model: model));
  initContact.add(ContactItemState(model: model2));

  initContact.add(ContactItemState(model: model21));
  initContact.add(ContactItemState(model:model3));
  initContact.add(ContactItemState(model:model4));

  initContact.add(ContactItemState(model:model22));
  initContact.add(ContactItemState(model:model5));

  ctx.dispatch(ContactsActionCreator.onContactListInit(initContact));
}