import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ninecoin/model/notification/notification_model.dart';

import '../../../config/config.dart';

Future<NotificationModel> getNotification() async {
  String url = Api.notification;
  var uri = Uri.parse(url);
  print(url);
  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return NotificationModel.fromJson(json.decode(response.body));
  } else {
    throw json.decode(response.body)["error"];
  }
}
