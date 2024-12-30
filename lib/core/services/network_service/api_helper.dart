import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../imports.dart';

part 'api_utility.dart';

abstract class ApiHelper extends ApiUtility {
  Future<Either<Failure, T>> postData<T>(
    String path, {
    bool authorizedApi = false,
    ApiResponseModel Function(dynamic)? customResponseModel,
    Map<String, dynamic>? body,
    Function(String)? onResponse,
    FormData? formDataBody,
    required T Function(Map<String, dynamic> json) responseConverter,
    Type? listType,
  }) async {
    return _executeApiCall<T>(
      () async {
        try {
          final Response<dynamic> response =
              await ApiService.getInstance().post(
            path,
            body: body,
            authorizedApi: authorizedApi,
            formDataBody: formDataBody,
          );

          if (onResponse != null) {
            onResponse(response.data);
          }

          return _handleStatusCode(
            response: response,
            customResponseModel: customResponseModel,
            responseConverter: responseConverter,
          );
        } catch (error) {
          LoggerService.logError(error.toString());
          Exception exception = _exceptionHandler(error as Exception);
          throw exception;
        }
      },
      refreshTokenCall: authorizedApi
          ? () async => await TokenDataSource.refreshToken()
          : null,
    );
  }

  Future<Either<Failure, T>> patch<T>(
    String path, {
    bool authorizedApi = false,
    ApiResponseModel Function(dynamic)? customResponseModel,
    Map<String, dynamic>? body,
    Function(String)? onResponse,
    FormData? formDataBody,
    required T Function(Map<String, dynamic> json) responseConverter,
    Type? listType,
  }) async {
    return _executeApiCall<T>(
      () async {
        try {
          final Response<dynamic> response =
              await ApiService.getInstance().patch(
            path,
            body: body,
            authorizedApi: authorizedApi,
            formDataBody: formDataBody,
          );

          if (onResponse != null) {
            onResponse(response.data);
          }

          return _handleStatusCode(
            response: response,
            customResponseModel: customResponseModel,
            responseConverter: responseConverter,
          );
        } catch (error) {
          LoggerService.logError(error.toString());
          Exception exception = _exceptionHandler(error as Exception);
          throw exception;
        }
      },
      refreshTokenCall: authorizedApi
          ? () async => await TokenDataSource.refreshToken()
          : null,
    );
  }

  Future<Either<Failure, T>> delete<T>(
    String path, {
    bool authorizedApi = false,
    ApiResponseModel Function(dynamic)? customResponseModel,
    Map<String, dynamic>? body,
    Function(String)? onResponse,
    FormData? formDataBody,
    required T Function(Map<String, dynamic> json) responseConverter,
    Type? listType,
  }) async {
    return _executeApiCall<T>(
      () async {
        try {
          final Response<dynamic> response =
              await ApiService.getInstance().delete(
            path,
            body: body,
            authorizedApi: authorizedApi,
            formDataBody: formDataBody,
          );

          if (onResponse != null) {
            onResponse(response.data);
          }

          return _handleStatusCode(
            response: response,
            customResponseModel: customResponseModel,
            responseConverter: responseConverter,
          );
        } catch (error) {
          LoggerService.logError(error.toString());
          Exception exception = _exceptionHandler(error as Exception);
          throw exception;
        }
      },
      refreshTokenCall: authorizedApi
          ? () async => await TokenDataSource.refreshToken()
          : null,
    );
  }

  Future<Either<Failure, T>> fetchData<T, B>(
    String path, {
    bool authorizedApi = false,
    Object? body,
    Function(Response<dynamic>)? onResponse,
    ApiResponseModel Function(dynamic)? customResponseModel,
    required Function(Map<String, dynamic> json) responseConverter,
  }) async {
    return _executeApiCall<T>(
      () async {
        try {
          final Response<dynamic> response = await ApiService.getInstance().get(
            path,
            authorizedApi: authorizedApi,
            body: body,
          );

          if (onResponse != null) {
            onResponse(response);
          }

          return _handleStatusCode<T, B>(
            response: response,
            customResponseModel: customResponseModel,
            responseConverter: responseConverter,
          );
        } catch (error) {
          LoggerService.logError(error.toString());
          Exception exception = _exceptionHandler(error as Exception);
          throw exception;
        }
      },
      refreshTokenCall: authorizedApi
          ? () async => await TokenDataSource.refreshToken()
          : null,
    );
  }

  Future<Either<Failure, T>> _executeApiCall<T>(
    Future<T> Function() apiCall, {
    Future<void> Function()? refreshTokenCall,
  }) async {
    try {
      T data = await apiCall();
      return right(data);
    } on UnauthorizedException {
      if (refreshTokenCall != null) {
        await refreshTokenCall();
        T data = await apiCall();
        return right(data);
      }
      return const Left<Failure, Never>(UnAuthorizedFailure());
    } on RefreshTokenExpiredException {
      return const Left<Failure, Never>(RefreshTokenExpiredFailure());
    } on ServerException {
      return const Left<Failure, Never>(ServerFailure());
    } on DataParsingException catch (e) {
      return Left<Failure, Never>(DataParsingFailure(e.message));
    } on CustomException catch (customExceptionObject) {
      return Left<Failure, Never>(CustomFailure(customExceptionObject.message));
    } on NoConnectionException {
      return const Left<Failure, Never>(NoConnectionFailure());
    } on TooManyRequestsException {
      return Left<Failure, Never>(TooManyRequestsFailure());
    }
  }
}
