import 'package:balance_project/imports.dart';
import 'package:dio/dio.dart';

class TokenDataSource extends ApiHelper {
  static Future<void> refreshToken({bool forceRefresh = false}) async {
    SecureStorageService pref = SecureStorageService.getInstance();
    try {
      final String? jsonObject =
          await pref.getValue(SecureStorageService.tokenData);

      if (jsonObject == null) {
        //in case the user is not logged in then get the content for public
        return;
      }

      TokenDataModel tokenDataModel = TokenDataModel.fromJson(jsonObject);
      DateTime? accessTokenExpiredDate = tokenDataModel.accessTokenExpireDate;
      DateTime now = DateTime.now();

      await isRefreshTokenExpired(tokenDataModel, now);
      if (forceRefresh == true ||
          accessTokenExpiredDate == null ||
          (now.isAfter(accessTokenExpiredDate))) {
        Map<String, String?> body = <String, String?>{
          "refreshTokenID": tokenDataModel.refreshTokenData?.id,
          "expiredAccessToken": tokenDataModel.accessToken,
          "refreshToken": tokenDataModel.refreshTokenData?.refreshToken,
        };
        Response<dynamic> result = await ApiService.getInstance().post(
          "Urls.refreshToken",
          body: body,
          authorizedApi: false,
        );
        if (result.statusCode == 200) {
          TokenDataModel responseTokenData =
              TokenDataModel.fromJson(result.data);
          var now = DateTime.now();
          var accessTokenExpireDate = now.add(const Duration(minutes: 3));
          responseTokenData.accessTokenExpireDate = accessTokenExpireDate;
          if (responseTokenData.refreshTokenData != null &&
              responseTokenData.accessToken != null &&
              responseTokenData.refreshTokenData?.id != null &&
              responseTokenData.refreshTokenData?.refreshToken != null) {
            await pref.setValue(
              SecureStorageService.tokenData,
              responseTokenData.toJson(),
            );
          }
        }
      }
    } catch (e) {
      if (e is RefreshTokenExpiredException) rethrow;
    }
  }

  static Future<void> isRefreshTokenExpired(
      TokenDataModel tokenDataModel, DateTime now) async {
    DateTime? refreshTokenExpiryDateUtcDateTime = DateTime.tryParse(
            tokenDataModel.refreshTokenData?.refreshTokenExpiryDate ?? "")
        ?.toUtc();
    DateTime? refreshTokenExpiryDate =
        refreshTokenExpiryDateUtcDateTime?.toLocal();
    bool isExpired = now.isAfter(refreshTokenExpiryDate!);
    if (isExpired) {
      // await getIt<UserDataCubit>().clearUserData();
      throw RefreshTokenExpiredException();
    }
  }
}
