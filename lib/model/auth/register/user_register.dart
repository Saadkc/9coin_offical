// To parse this JSON data, do
//
//     final userRegister = userRegisterFromMap(jsonString);

import 'dart:convert';

UserRegister userRegisterFromMap(String str) =>
    UserRegister.fromMap(json.decode(str));

String userRegisterToMap(UserRegister data) => json.encode(data.toMap());

class UserRegister {
  UserRegister({
    this.name,
    this.email,
    this.gender,
    this.address,
    this.point,
    this.qrcode,
    this.avatarphotourl,
    this.phonenumber,
    this.password,
    this.confirmPassword,
  });

  final String? name;
  final String? email;
  final String? gender;
  final String? address;
  final String? point;
  final String? qrcode;
  final String? avatarphotourl;
  final String? phonenumber;
  final String? password;
  final String? confirmPassword;

  factory UserRegister.fromMap(Map<String, dynamic> json) => UserRegister(
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        address: json["address"],
        point: json["point"],
        qrcode: json["qrcode"],
        avatarphotourl: json["avatarphotourl"],
        phonenumber: json["phonenumber"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "gender": gender,
        "point": 0,
        "address": address,
        "phonenumber": phonenumber,
        "password": password,
        "confirm_password": confirmPassword,
        "qrcode": qrcode,
        "avatarphotourl": avatarphotourl,
      };
}
