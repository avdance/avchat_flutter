import 'package:avchat_flutter/model/user.dart';

///联系人Item的实体类
class ContactItemModel extends User{

  String label;
  bool isTitle = false;
  bool isDiv = true;

  ContactItemModel(int uid) : super(uid);

  ContactItemModel.fromJson(Map<String, dynamic> json) : super.fromJson(json){
    this.label = json["label"];
  }


}