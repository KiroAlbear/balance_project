import 'package:balance_project/imports.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      if (options.headers.containsKey("Authorization") &&
          options.headers["Authorization"]) {
        options.headers.remove("Authorization");
        SecureStorageService pref = await SecureStorageService.getInstance();
        String? stringTokenData =
            await pref.getValue(SecureStorageService.tokenData);
        if (stringTokenData != null) {
          TokenDataModel tokenData = TokenDataModel.fromJson(stringTokenData);
          options.headers['Authorization'] = 'Bearer ${tokenData.accessToken}';
        }
        // Logger.log(token ?? "TOKEN NOT FOUND");
        return handler.next(options);
      }
      return handler.next(options);
    } catch (e) {}
  }

  int attempt = 3;
  @override
  Future<dynamic> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    LoggerService.logError(
        "APISERVICE ON ERROR+ ${err.message ?? ""} + ${err.stackTrace.toString()}");
    return handler.reject(err);
  }

  @override
  Future<dynamic> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}
