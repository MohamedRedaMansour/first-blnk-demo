import 'dart:convert';
import 'package:dio/dio.dart';
import 'api_client.dart';
import 'constant.dart';
import 'get_response.dart';

class ApiCall {
  static void makeCall(String method, String apiName, Map<String, Object> body,
      GetResponse responseCallback,
      [bool isRetry = false]) {
    // AppSharedPref.getString(AppSharedPref.KEY_AUTH_KEY).then((value) {
    var dio = ApiClient.getInstance();

    switch (method) {
      case Constant.METHOD_GET:
        dio!.get(apiName, queryParameters: body).then((response) {
          responseCallback.getResponse(response);
        }).catchError((err) {
          if (!isRetry && err is DioError && err.response != null && err.response!.statusCode == 401) {
            makeCall(method, apiName, body, responseCallback, true);
          } else {
            try {
              responseCallback.getResponse(Response(requestOptions: RequestOptions(path: "") ,statusCode: err.error.osError.errorCode));
            } on Exception catch (exception) {
              responseCallback.getResponse(Response(requestOptions: RequestOptions(path: "") ,statusCode:  err.response.statusCode));
            } catch (error) {
              responseCallback.getResponse(Response(requestOptions: RequestOptions(path: "") ,statusCode:  err.response.statusCode));
            }
          }
        });
        break;

      case Constant.METHOD_POST:
        dio!.post(apiName, data: jsonEncode(body)).then((response) {
          responseCallback.getResponse(response);
        }).catchError((err) {
          if (!isRetry && err is DioError && err.response != null && err.response!.statusCode == 401) {
            makeCall(method, apiName, body, responseCallback, true);
          } else {
            try {
              responseCallback.getResponse(Response(requestOptions: RequestOptions(path: "") ,statusCode: err.error.osError.errorCode));
            } on Exception catch (exception) {
              responseCallback.getResponse(Response(requestOptions: RequestOptions(path: "") ,statusCode:  err.response.statusCode));
            } catch (error) {
              responseCallback.getResponse(Response(requestOptions: RequestOptions(path: "") ,statusCode:  err.response.statusCode));
            }
          }
        });

        break;
    }
    // });
  }
}
