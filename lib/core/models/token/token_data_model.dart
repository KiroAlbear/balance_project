import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenDataModel {
  String? accessToken;
  DateTime? accessTokenExpireDate;
  RefreshTokenData? refreshTokenData;

  TokenDataModel({
    this.accessToken,
    this.accessTokenExpireDate,
    this.refreshTokenData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshTokenData': refreshTokenData?.toMap(),
      'accessTokenExpireDate': accessTokenExpireDate.toString()
    };
  }

  factory TokenDataModel.fromMap(Map<String, dynamic> map) {
    return TokenDataModel(
      accessToken:
          map['accessToken'] != null ? map['accessToken'] as String : null,
      accessTokenExpireDate: map['accessTokenExpireDate'] != null
          ? DateTime.tryParse(map['accessTokenExpireDate'])
          : null,
      refreshTokenData: map['refreshTokenData'] != null
          ? RefreshTokenData.fromMap(
              map['refreshTokenData'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenDataModel.fromJson(String source) =>
      TokenDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class RefreshTokenData {
  String? id;
  String? userID;
  String? refreshToken;
  String? refreshTokenExpiryDate;
  RefreshTokenData({
    this.id,
    this.userID,
    this.refreshToken,
    this.refreshTokenExpiryDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userID': userID,
      'refreshToken': refreshToken,
      'refreshTokenExpiryDate': refreshTokenExpiryDate,
    };
  }

  factory RefreshTokenData.fromMap(Map<String, dynamic> map) {
    return RefreshTokenData(
      id: map['id'] != null ? map['id'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
      refreshTokenExpiryDate: map['refreshTokenExpiryDate'] != null
          ? map['refreshTokenExpiryDate'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshTokenData.fromJson(String source) =>
      RefreshTokenData.fromMap(json.decode(source) as Map<String, dynamic>);
}
