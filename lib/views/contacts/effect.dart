import 'package:avchat_flutter/model/contact_item.dart';
import 'package:avchat_flutter/views/contacts/item/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ContactsState> buildEffect() {
  return combineEffects(<Object, Effect<ContactsState>>{
    Lifecycle.initState: _initContact
  });
}


///获取数据
void _initContact(Action action, Context<ContactsState> ctx) {
  final List<ContactItemState> initContact = new List<ContactItemState>();
  //几个固定的Item
  ContactItemModel model20 = ContactItemModel(20);
  model20.isTitle = true;
  model20.label = "Android";

  ContactItemModel model = ContactItemModel(11);
  model.niceName = "android";
  model.headerImage = "https://wangzhumo.com/img/android.png";
  ContactItemModel model2 = ContactItemModel(12);
  model.niceName = "media";
  model.headerImage = "https://wangzhumo.com/img/media.png";


  ContactItemModel model21 = ContactItemModel(21);
  model20.isTitle = true;
  model20.label = "音视频";
  ContactItemModel model3 = ContactItemModel(12);
  model.niceName = "coding";
  model.headerImage = "https://wangzhumo.com/img/coding.png";

  ContactItemModel model4 = ContactItemModel(14);
  model.niceName = "camera";
  model.headerImage = "https://wangzhumo.com/img/camera.png";


  ContactItemModel model22 = ContactItemModel(22);
  model20.isTitle = true;
  model20.label = "FFmpeg";
  ContactItemModel model5 = ContactItemModel(15);
  model.niceName = "ffmpeg";
  model.headerImage = "https://wangzhumo.com/img/ffmpeg.png";

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