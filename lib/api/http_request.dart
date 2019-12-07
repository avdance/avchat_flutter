import 'package:avchat_flutter/api/api.dart';

///封装网络请求
class HttpRequest {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null
  };
}
