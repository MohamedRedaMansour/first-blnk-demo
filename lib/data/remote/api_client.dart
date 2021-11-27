
import 'package:dio/dio.dart';

import 'constant.dart';
import 'logging_interceptor.dart';

class ApiClient {

  static const int CONNECT_TIMEOUT_TIME = 5000;
  static const int RECEIVE_TIMEOUT_TIME = 5000;
  static Dio? client;

  static Dio? getInstance() {
    if (client == null) {
      client = Dio();
      client!.options.baseUrl = Constant.BASE_URL;
      client!.options.connectTimeout = CONNECT_TIMEOUT_TIME;
      client!.options.receiveTimeout = RECEIVE_TIMEOUT_TIME;
      client!.options.headers['Accept'] = 'application/json';
      client!.options.contentType = 'application/json';
      client!.options.headers['Authorization'] = 'Bearer nxsxbudwg6yd2uq461x3iioe0a0i76zj';
      client!.options.followRedirects = false;
      client!.interceptors.add(LoggingInterceptor());
    }
    return client;
  }
}
