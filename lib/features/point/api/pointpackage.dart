import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/config.dart';
import 'package:http/http.dart' as http;

class pointpackage {
  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    int? intvalue = prefs.getInt('userId');
    // print(intvalue);
    return intvalue;
  }

  Future<List> getpointpackages() async {
    String url = Api.getpointpackage;
    print(url);
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<pointpackageresponse> getpointpackage() async {
    String url = Api.getpointpackage;

    print(url);
    var uri = Uri.parse(url);

    var response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return pointpackageresponse.fromJson(json.decode(response.body));
    } else {
      throw json.decode(response.body)["error"];
    }
  }
}

class pointpackageresponse {
  pointpackageresponse({
    required this.data,
  });

  final List<Datum> data;

  factory pointpackageresponse.fromJson(Map<String, dynamic> json) =>
      pointpackageresponse(
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
    required this.point,
    required this.myr,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int point;
  final String name;
  final String myr;
  final dynamic createdAt;
  final DateTime? updatedAt;
  final String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        description: json["description"],
        point: json["point"],
        myr: json["myr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "description": description,
        "point": point,
        "myr": myr,

        //"participants": List<dynamic>.from(participants!.map((x) => x)),
      };
}
