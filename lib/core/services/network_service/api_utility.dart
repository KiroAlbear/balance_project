part of 'api_helper.dart';

abstract class ApiUtility {
  // Common utility method to handle API response status codes
  T _handleStatusCode<T, B>({
    required Response<dynamic> response,
    ApiResponseModel Function(dynamic)? customResponseModel,
    required Function(Map<String, dynamic> json) responseConverter,
  }) {
    if (response.statusCode == 200) {
      final ApiResponseModel apiResponse =
          _handleApiResponseModel(response, customResponseModel);
      return _dataConverterHelper<T, B>(
        apiResponseModel: apiResponse,
        responseConverter: responseConverter,
      );
    } else {
      throw ServerException();
    }
  }

  ApiResponseModel _handleApiResponseModel(Response<dynamic> response,
      ApiResponseModel Function(dynamic)? customResponseModel) {
    try {
      return customResponseModel != null
          ? customResponseModel(response.data)
          : ApiResponseModel.fromJson(json.decode(response.data));
    } catch (e) {
      throw DataParsingException(message: e.toString());
    }
  }

  dynamic _dataConverterHelper<T, B>({
    required ApiResponseModel apiResponseModel,
    required Function(Map<String, dynamic> json) responseConverter,
  }) {
    // try {
    if (apiResponseModel.data is Map<String, dynamic>) {
      return responseConverter(apiResponseModel.data);
    } else if (apiResponseModel.data is List) {
      return JsonToListConverter.convertJsonToList<T, B>(
          apiResponseModel, responseConverter);
    } else {
      Map<String,dynamic> data = Map<String, dynamic>();
      data['message'] = apiResponseModel.message;
      return responseConverter(data);
    }
    // } catch (e) {
    //   throw DataParsingException(message: e.toString());
    // }
  }

  Exception _exceptionHandler(Exception e) {
    if (e is DioException) {
      switch (e.response?.statusCode) {
        case 400:
          return CustomException(message: [
            json.decode(e.response?.data)['error'].toString()
          ]);
        case 401:
          return UnauthorizedException();
        case 429:
          return TooManyRequestsException();
        default:
          return ServerException();
      }
    }

    if ((e is ServerException) ||
        (e is CustomException) ||
        (e is DataParsingException) ||
        (e is UnauthorizedException) ||
        (e is RefreshTokenExpiredException)) {
      return e;
    } else if (e is FormatException) {
      return DataParsingException(message: 'Data format error');
    } else {
      return NoConnectionException();
    }
  }
}
