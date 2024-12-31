import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../imports.dart';

class ApiService {
  static Dio dio = Dio();
  static ApiService? _instance;
  final int callAttempts = 3;

  static ApiService getInstance() {
    if (_instance == null) {
      BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        // sendTimeout: const Duration(seconds: 30),
      );

      dio.httpClientAdapter = HttpClientAdapter();
      dio.options = options;
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ));

      _instance = ApiService();
    }
    return _instance!;
  }

  Future<Response<dynamic>> get(String uri,
      {bool authorizedApi = false, Object? body, int attempt = 1}) async {
    try {
      Response<dynamic> res = await dio.get(
        uri,
        data: body,
        options: _getOption(authorizedApi),
      );

      return res;
    } catch (ex) {
      if (attempt < callAttempts) {
        // Increment attempt count and wait before retrying
        return get(uri,
            authorizedApi: authorizedApi, body: body, attempt: attempt + 1);
      } else {
        // Log error after exceeding max attempts
        LoggerService.logError("APISERVICE ON ERROR$ex${StackTrace.current}");

        rethrow;
      }
    }
  }

  Future<Response<dynamic>> post(String uri,
      {bool authorizedApi = false,
      Map<String, dynamic>? body,
      FormData? formDataBody,
      int attempt = 1}) async {
    try {
      Object? data = body ?? formDataBody;

      Response<dynamic> res = await dio.post(
        uri,
        data: data,
        options: _getOption(authorizedApi),
      );
      return res;
    } catch (ex) {
      // if (attempt < callAttempts) {
      //   // Increment attempt count and wait before retrying
      //   return post(uri,
      //       authorizedApi: authorizedApi,
      //       body: body,
      //       formDataBody: formDataBody,
      //       attempt: attempt + 1);
      // } else
      {
        // Log error after exceeding max attempts
        LoggerService.logError("APISERVICE ON ERROR$ex${StackTrace.current}");

        rethrow;
      }
    }
  }

  Future<Response<dynamic>> delete(String uri,
      {bool authorizedApi = false,
      Map<String, dynamic>? body,
      FormData? formDataBody,
      int attempt = 1}) async {
    try {
      Object? data = body ?? formDataBody;

      Response<dynamic> res = await dio.delete(
        uri,
        data: data,
        options: _getOption(authorizedApi),
      );
      return res;
    } catch (ex) {
      // if (attempt < callAttempts) {
      //   // Increment attempt count and wait before retrying
      //   return patch(uri,
      //       authorizedApi: authorizedApi,
      //       body: body,
      //       formDataBody: formDataBody,
      //       attempt: attempt + 1);
      // }
      //  else
      {
        // Log error after exceeding max attempts
        LoggerService.logError("APISERVICE ON ERROR$ex${StackTrace.current}");

        rethrow;
      }
    }
  }

  Future<Response<dynamic>> patch(String uri,
      {bool authorizedApi = false,
      Map<String, dynamic>? body,
      FormData? formDataBody,
      int attempt = 1}) async {
    try {
      Object? data = body ?? formDataBody;

      Response<dynamic> res = await dio.patch(
        uri,
        data: data,
        options: _getOption(authorizedApi),
      );
      return res;
    } catch (ex) {
      // if (attempt < callAttempts) {
      //   // Increment attempt count and wait before retrying
      //   return patch(uri,
      //       authorizedApi: authorizedApi,
      //       body: body,
      //       formDataBody: formDataBody,
      //       attempt: attempt + 1);
      // }
      //  else
      {
        // Log error after exceeding max attempts
        LoggerService.logError("APISERVICE ON ERROR$ex${StackTrace.current}");

        rethrow;
      }
    }
  }

  Future<bool> isConnectedToInternet() async {
    try {
      Response<dynamic> res = await dio.get(
        Urls.testConnectionUrl,
        options: Options(
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
          responseType: ResponseType.plain,
        ),
      );
      return res.statusCode == 200;
    } on SocketException {
      return false;
    }
  }

  Options _getOption(bool isAuthorizedApi) {
    return Options(
      headers: _getHeaders(isAuthorizedApi),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      responseType: ResponseType.plain,
    );
  }

  Map<String, Object> _getHeaders(bool isAuthorizedApi) {
    Map<String, Object> headers = <String, Object>{
      'Content-Type': 'application/json',
      'Accept': '*/*',
      // 'AgentType': Platform.isAndroid ? 2 : 1,
    };
    if (isAuthorizedApi) headers["Authorization"] = isAuthorizedApi;
    return headers;
  }
}
