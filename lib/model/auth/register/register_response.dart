// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.success,
  });

  final Success success;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        success: Success.fromJson(json["success"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success.toJson(),
      };
}

class Success {
  Success({
    this.name,
    this.email,
    this.gender,
    this.address,
    this.point,
    this.qrcode,
    this.avatarphotourl,
    this.phonenumber,
    this.id,
  });

  final String? name;
  final String? email;
  final String? gender;
  final String? address;
  final String? point;
  final String? qrcode;
  final String? avatarphotourl;
  final String? phonenumber;
  final int? id;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        address: json["address"],
        point: json["point"].toString(),
        qrcode: json["qrcode"],
        avatarphotourl: json["avatarphotourl"],
        phonenumber: json["phonenumber"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "address": address,
        "point": point,
        "qrcode": qrcode,
        "avatarphotourl": avatarphotourl,
        "phonenumber": phonenumber,
        "id": id,
      };
}
