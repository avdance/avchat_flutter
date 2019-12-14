import 'dart:io';

import 'package:avchat_flutter/api/base_response.dart';
import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';

import 'http_param_interceptor.dart';

///封装网络请求
class HttpRequest {
  /// dio object
  static Dio dio;
  static ParamInterceptors interceptors = ParamInterceptors();

  /// default options
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String DELETE = 'delete';

  Future<BaseResponse> get(String url, {data}) async {
    return _request(url, data: data, option: Options(method: GET))
        .then((value) => composeResponse(value));
  }

  Future<BaseResponse> post(String url, {data}) async {
    return _request(url,
            data: data,
            option: Options(
                method: POST,
                contentType:
                    ContentType.parse("application/x-www-form-urlencoded")))
        .then((value) => composeResponse(value));
  }

  Future<BaseResponse> put(String url, {data}) async {
    return _request(url, data: data, option: Options(method: PUT))
        .then((value) => composeResponse(value));
  }

  Future<BaseResponse> delete(String url, {data}) async {
    return _request(url, data: data, option: Options(method: DELETE))
        .then((value) => composeResponse(value));
  }

  /// compose response
  BaseResponse composeResponse(dynamic value) {
    if (value != null) {
      BaseResponse response = BaseResponse.fromJson(value);
      if (response != null) {
        return response;
      }
    }
    return new BaseResponse(-1, msg: "网络错误");
  }

  ///统一请求
  Future<dynamic> _request(String url, {data, option}) async {
    if(data != null){
      data['token'] = interceptors.getToken();
    }else{
      data = [];
      data['token'] = interceptors.getToken();
    }
    option = option ?? Options(method: GET);

    Dio dio = instance();

    /// 打印请求相关信息：请求地址、请求方式、请求参数
    println('Request Url : ' + url);
    println('Request Params : ' + data.toString());

    var result;

    try {
      Response response = await dio.request(url, data: data, options: option);
      result = response.data;
      println('Request Succeed.');
    } on DioError catch (e) {
      println('Request Error : ' + e.toString());
    }

    return result;
  }

  /// dio 实例
  static Dio instance() {
    if (dio == null) {
      BaseOptions option = new BaseOptions(
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          headers: {"user-agent": "dio"},
          contentType: ContentType.json,
          responseType: ResponseType.plain);
      dio = new Dio(option);
      dio.interceptors.add(interceptors);
    }

    return dio;
  }

  /// release dio 对象
  static release() {
    dio = null;
  }

  /// update token
  static updateToken(String token) {
    if (interceptors != null) {
      interceptors.updateToken(token);
    }
  }
}
