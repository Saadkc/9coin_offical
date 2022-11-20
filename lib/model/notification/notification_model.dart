// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    NotificationModel({
        required this.data,
    });

    final List<Datum> data;

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.type,
        required this.notifiableType,
        required this.notifiableId,
        required this.data,
        required this.readAt,
        required this.createdAt,
        required this.updatedAt,
        required this.icon,
    });

    final String id;
    final String type;
    final String notifiableType;
    final int notifiableId;
    final String data;
    final String readAt;
    final dynamic createdAt;
    final dynamic updatedAt;
    final dynamic icon;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        notifiableType: json["notifiable_type"],
        notifiableId: json["notifiable_id"],
        data: json["data"],
        readAt: json["read_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "notifiable_type": notifiableType,
        "notifiable_id": notifiableId,
        "data": data,
        "read_at": readAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "icon": icon,
    };
}
