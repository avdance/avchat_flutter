import 'dart:io';

import 'package:avchat_flutter/api/api.dart';
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

  Future<dynamic> get(String url, {data}) async {
    _request(url, data: data, method: GET);
  }

  Future<dynamic> post(String url, {data}) async {
    _request(url, data: data, method: POST);
  }

  Future<dynamic> put(String url, {data}) async {
    _request(url, data: data, method: PUT);
  }

  Future<dynamic> delete(String url, {data}) async {
    _request(url, data: data, method: DELETE);
  }

  ///统一请求
  Future<dynamic> _request(String url, {data, method}) async {
    data = data ?? {};
    method = method ?? 'GET';

    Dio dio = instance();

    /// 打印请求相关信息：请求地址、请求方式、请求参数
    println('Request Url : ' +  url);
    println('Request Params : ' + data.toString());

    var result;

    try {
      Response response = await dio.request(url,
          data: data, options: Options(method: method));
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
