import 'package:avchat_flutter/main.dart';
import 'package:avchat_flutter/resources/shared_preferences_keys.dart';
import 'package:avchat_flutter/utils/text_utils.dart';
import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';

///公共参数的拦截器
class ParamInterceptors extends InterceptorsWrapper {

  static String token;

  ParamInterceptors(){
    token = sharepre.getString(SharedPreferencesKeys.TOKEN);
  }

  @override
  onRequest(RequestOptions options) {
    if(!TextUtils.isEmpty(token)){
      println("ParamInterceptors add Token = $token");
      options.uri.queryParameters.putIfAbsent("token", () => token);
    }else{
      //TODO 回调直接失败
      //应该调起重新登录.
      sharepre.putString(SharedPreferencesKeys.TOKEN, "");
    }
    return super.onRequest(options);
  }

  ///更新Token
  void updateToken(String tokenStr){
    token = tokenStr;
    sharepre.putString(SharedPreferencesKeys.TOKEN, tokenStr);
  }
}
