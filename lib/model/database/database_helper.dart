import 'package:avchat_flutter/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  static Database _db;

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal(){
    //do thing
  }

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDatabase();
    return _db;
  }

  //init database
  initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "main.db";

    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(uid INTEGER PRIMARY KEY, userName TEXT, "
        "password TEXT, niceName TEXT, loginStatus INTEGER, gender INTEGER, headerImage TEXT, createtime INTEGER)");
  }

  ///保存一个用户
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toJson());
    return res;
  }

  ///获取所有的用户数据
  Future<List<User>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    List<User> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var userMap = list[i];

      var user = new User(userMap["uid"],
          userName: userMap["userName"],
          niceName: userMap["niceName"],
          loginStatus: userMap["loginStatus"],
          gender: userMap["gender"],
          headerImage: userMap["headerImage"],
          createtime: userMap["createtime"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }


  ///获取所有的用户数据
  Future<User> getUserByUID(int uid) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User WHERE uid = ?',[uid]);
    var user = new User(uid);
    if(list != null && list.length > 0){
      var userMap = list[0];
      user = new User(userMap["uid"],
          userName: userMap["userName"],
          niceName: userMap["niceName"],
          loginStatus: userMap["loginStatus"],
          gender: userMap["gender"],
          headerImage: userMap["headerImage"],
          createtime: userMap["createtime"]);
    }
    return user;
  }

  ///删除指定的用户
  Future<int> deleteUsers(String uid) async {
    var dbClient = await db;
    int res = await dbClient.rawDelete('DELETE FROM User WHERE uid = ?',[uid]);
    return res;
  }

  ///更新用户
  Future<bool> update(User user) async {
    var dbClient = await db;
    int res = await dbClient.update("User", user.toJson(), where: "uid = ?", whereArgs: <int>[user.uid]);
    return res > 0 ? true : false;
  }
}
