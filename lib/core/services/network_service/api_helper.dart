import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../imports.dart';

part 'api_utility.dart';

abstract class ApiHelper extends ApiUtility {
  Future<Either<Failure, T>> postData<T>(
    String path, {
    Map<String, dynamic>? body,
    Function(String)? onResponse,
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
          );

          if (onResponse != null) {
            onResponse(response.data);
          }

          return _handleStatusCode(
            response: response,
            responseConverter: responseConverter,
          );
        } catch (error) {
          LoggerService.logError(error.toString());
          Exception exception = _exceptionHandler(error as Exception);
          throw exception;
        }
      },
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
    );
  }

  Future<Either<Failure, T>> _executeApiCall<T>(
      Future<T> Function() apiCall) async {
    try {
      T data = await apiCall();
      return right(data);
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
