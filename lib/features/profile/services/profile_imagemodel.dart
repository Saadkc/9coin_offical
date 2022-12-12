import 'dart:convert';

ImageGet imageGetFromJson(String str) => ImageGet.fromJson(json.decode(str));

String imageGetToJson(ImageGet data) => json.encode(data.toJson());

class ImageGet {
    ImageGet({
        this.statusCode,
        this.status,
        this.profilePic,
    });

    int? statusCode;
    int? status;
    String? profilePic;

    factory ImageGet.fromJson(Map<String, dynamic> json) => ImageGet(
        statusCode: json["status_code"],
        status: json["status"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status": status,
        "profile_pic": profilePic,
    };
}
