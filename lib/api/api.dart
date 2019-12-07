//API 请求的所有地址
class Api {
  //base url
  static const String BASE_URL = 'http://phab.avdance.top:3000/';

  //登陆
  static const String LOGIN = BASE_URL + 'api/login';
  //注册
  static const String REGISTER = BASE_URL + 'api/register';
  //用户信息
  static const String USER_INFO = BASE_URL + 'api/user/id';
  //好友列表
  static const String FRIEND = BASE_URL + 'api/friends/id';
  //添加好友
  static const String ADD_FRIEND = BASE_URL + 'api/friends';
}
