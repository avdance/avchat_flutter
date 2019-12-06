///
/// 用户
///
class User {
  int uid;
  String userName;
  String password;
  String niceName;
  String tableName;
  String headerImage;
  String createtime;
  int loginStatus;
  int terminalType;
  int gender;
  int status;

  User(this.uid,{
      this.userName,
      this.password,
      this.niceName,
      this.loginStatus,
      this.terminalType,
      this.tableName,
      this.gender,
      this.headerImage,
      this.status,
      this.createtime});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userName = json['userName'];
    password = json['password'];
    niceName = json['niceName'];
    loginStatus = json['loginStatus'];
    terminalType = json['terminalType'];
    tableName = json['tableName'];
    gender = json['gender'];
    headerImage = json['headerImage'];
    status = json['status'];
    createtime = json['createtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['niceName'] = this.niceName;
    data['loginStatus'] = this.loginStatus;
    data['terminalType'] = this.terminalType;
    data['tableName'] = this.tableName;
    data['gender'] = this.gender;
    data['headerImage'] = this.headerImage;
    data['status'] = this.status;
    data['createtime'] = this.createtime;
    return data;
  }
}
