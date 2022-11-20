// To parse this JSON data, do
//
//     final luckyDrawResponse = luckyDrawResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LuckyDrawResponse luckyDrawResponseFromJson(String str) =>
    LuckyDrawResponse.fromJson(json.decode(str));

String luckyDrawResponseToJson(LuckyDrawResponse data) =>
    json.encode(data.toJson());

class LuckyDrawResponse {
  LuckyDrawResponse({
    required this.data,
  });

  final List<Datum> data;

  factory LuckyDrawResponse.fromJson(Map<String, dynamic> json) =>
      LuckyDrawResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

LuckyDrawListResponse luckyDrawListResponseFromJson(String str) =>
    LuckyDrawListResponse.fromJson(json.decode(str));

String luckyDrawListResponseToJson(LuckyDrawListResponse data) =>
    json.encode(data.toJson());

class LuckyDrawListResponse {
  LuckyDrawListResponse({
    required this.data,
  });

  final List<LuckyDrawParticipateList> data;

  factory LuckyDrawListResponse.fromJson(Map<String, dynamic> json) =>
      LuckyDrawListResponse(
        data: List<LuckyDrawParticipateList>.from(
            json["data"].map((x) => LuckyDrawParticipateList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LuckyDrawParticipateList {
  LuckyDrawParticipateList({
    required this.id,
    required this.userid,
    required this.createdAt,
    required this.updatedAt,
    required this.redeemstatus,
    required this.luckydrawid,
    required this.winningstatus,
    required this.drawnstatus,
  });

  final int id;
  final int userid;
  final dynamic createdAt;

  final DateTime? updatedAt;
  final int redeemstatus;
  final int winningstatus;
  final int drawnstatus;
  final int luckydrawid;

  factory LuckyDrawParticipateList.fromJson(Map<String, dynamic> json) =>
      LuckyDrawParticipateList(
        id: json["id"],
        userid: json["userid"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        redeemstatus: json["redeemstatus"],
        luckydrawid: json["luckydrawid"],
        winningstatus: json["winningstatus"],
        drawnstatus: json["drawnstatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "redeemstatus": redeemstatus,
        "luckydrawid": luckydrawid,
        "winningstatus": winningstatus,
        "drawnstatus": drawnstatus,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.date,
    required this.prize,
    required this.prizeImage,
    required this.pointsNeeded,
    required this.maximum,
    required this.winner,
    required this.participants,
    required this.drawnstatus,
    required this.count,
    required this.SEdate,
    required this.totalcount,
  });

  final int id;
  final int drawnstatus;
  final String name;
  final dynamic createdAt;
  final DateTime? updatedAt;
  final String description;
  final dynamic date;
  final String prize;
  final String prizeImage;
  final int pointsNeeded;
  final int maximum;
  final int count;
  final int totalcount;
  final String winner;
  final String SEdate;
  final List<dynamic>? participants;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        description: json["description"],
        date: json["date"],
        prize: json["prize"],
        prizeImage: json["prize_image"],
        pointsNeeded: json["Points_needed"],
        maximum: json["maximum"],
        winner: json["winner"],
        drawnstatus: json["drawnstatus"],
        count: json["count"],
        totalcount: json["totalcount"],
        SEdate: json["SEdate"],
        participants: json["participants"] == null
            ? null
            : List<dynamic>.from(json["participants"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "description": description,
        "date": date,
        "prize": prize,
        "prize_image": prizeImage,
        "Points_needed": pointsNeeded,
        "maximum": maximum,
        "winner": winner,
        "drawnstatus": drawnstatus,
        "count": count,
        "totalcount": totalcount,
        "SEdate": SEdate,
        "participants": List<dynamic>.from(participants!.map((x) => x)),
        //"participants": List<dynamic>.from(participants!.map((x) => x)),
      };
}
