// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));
GetUserData getuserdataFromJson(String str) =>
    GetUserData.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
String getuserdataResponseToJson(GetUserData data) =>
    json.encode(data.toJson());

class GetUserData {
  GetUserData({
    required this.data,
  });

  final Data data;

  factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class LoginResponse {
  LoginResponse({
    required this.statusCode,
    required this.status,
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  final int statusCode;
  final int status;
  final String accessToken;
  final String tokenType;
  final Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        statusCode: json["status_code"],
        status: json["status"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status": status,
        "access_token": accessToken,
        "token_type": tokenType,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.address,
    required this.point,
    required this.qrcode,
    required this.avatarphotourl,
    required this.phonenumber,
    required this.emailVerifiedAt,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
  });

  final int id;
  final String name;
  final String email;
  final String gender;
  final String address;
  final int point;
  final String qrcode;
  final String? avatarphotourl;
  final String phonenumber;
  final dynamic emailVerifiedAt;

  final dynamic currentTeamId;
  final dynamic profilePhotoPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String profilePhotoUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        address: json["address"],
        point: json["point"],
        qrcode: json["qrcode"],
        avatarphotourl: json["avatarphotourl"],
        phonenumber: json["phonenumber"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "address": address,
        "point": point,
        "qrcode": qrcode,
        "avatarphotourl": avatarphotourl,
        "phonenumber": phonenumber,
        "email_verified_at": emailVerifiedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "profile_photo_url": profilePhotoUrl,
      };
}
