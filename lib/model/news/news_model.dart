// To parse this JSON data, do
//
//     final getNews = getNewsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetNews getNewsFromJson(String str) => GetNews.fromJson(json.decode(str));

String getNewsToJson(GetNews data) => json.encode(data.toJson());

class GetNews {
  GetNews({
    required this.data,
  });

  final List<Datum> data;

  factory GetNews.fromJson(Map<String, dynamic> json) => GetNews(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.photo,
    required this.date,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.extendedDescriptions,
    required this.extendedImages,
  });

  final int id;
  final String name;
  final String description;
  final String photo;
  final String date;
  final int status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final List<ExtendedDescription> extendedDescriptions;
  final List<ExtendedImage> extendedImages;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        photo: json["photo"],
        date: json["date"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        extendedDescriptions: List<ExtendedDescription>.from(
            json["Extended_Descriptions"]
                .map((x) => ExtendedDescription.fromJson(x))),
        extendedImages: List<ExtendedImage>.from(
            json["Extended_Images"].map((x) => ExtendedImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photo": photo,
        "date": date,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "Extended_Descriptions":
            List<dynamic>.from(extendedDescriptions.map((x) => x.toJson())),
        "Extended_Images":
            List<dynamic>.from(extendedImages.map((x) => x.toJson())),
      };
}

class ExtendedDescription {
  ExtendedDescription({
    required this.desc,
  });

  final String desc;

  factory ExtendedDescription.fromJson(Map<String, dynamic> json) =>
      ExtendedDescription(
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
      };
}

class ExtendedImage {
  ExtendedImage({
    required this.img,
  });

  final String img;

  factory ExtendedImage.fromJson(Map<String, dynamic> json) => ExtendedImage(
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
      };
}
