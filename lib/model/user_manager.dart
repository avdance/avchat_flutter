import 'package:avchat_flutter/model/database/database_helper.dart';
import 'package:avchat_flutter/model/user.dart';
import 'package:avchat_flutter/resources/shared_preferences_keys.dart';

import '../main.dart';

///用户管理类，只保存自己

class UserManage {
  factory UserManage() => getInstance();

  static UserManage get instance => getInstance();
  static UserManage _instance;
  static User userInfo;

  static UserManage getInstance() {
    if (_instance == null) {
      _instance = new UserManage._internal();
    }
    return _instance;
  }

  UserManage._internal() {
    //如果有值，填充User
    var database = new DatabaseHelper();
    database.db;
    getUser();
  }

  ///获取用户
  getUser() async {
    var uid = sharepre.getInt(SharedPreferencesKeys.USER_INFO);
    if (uid == null) return null;
    return await DatabaseHelper.internal().getUserByUID(uid);
  }

  ///保存一个用户
  saveUser(User user) {
    //保存一个用户
    //更新这个User
    userInfo = user;
    //更新
    sharepre.putInt(SharedPreferencesKeys.USER_INFO,user.uid);
    DatabaseHelper.internal().saveUser(user);
  }
}
