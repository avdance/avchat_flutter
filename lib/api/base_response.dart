import 'package:fish_redux/fish_redux.dart';
import 'dart:convert';

/// 基础返回
class BaseResponse {
  String msg;
  String token;
  int errCode;
  int code;
  Map<String, dynamic> data;

  BaseResponse(int code, {msg});

  BaseResponse.fromJson(String value) {
    Map<String, dynamic> jsonObject = json.decode(value);
    msg = jsonObject['msg'];
    code = jsonObject['code'];
    data = jsonObject['data'];
    token = jsonObject['token'];
    errCode = jsonObject['errCode'];
  }

  bool isSuccessful() {
    println("msg = $msg  ,code = $code   errCode = $errCode");
    if (code == null && errCode > 0) {
      return false;
    }
    if (errCode == null && code == 0) {
      return true;
    }
    if (errCode == null && code == null) {
      return false;
    }
    return false;
  }

  Map<String, dynamic> getData() {
    return data;
  }

  String getToken() {
    return token;
  }

  String getMessage() {
    return msg;
  }
}
