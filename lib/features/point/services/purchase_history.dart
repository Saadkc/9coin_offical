import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ninecoin/features/point/services/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/config.dart';
import 'package:http/http.dart' as http;

Future<String> purchaseHistoryPdf(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String url = Api.getPdf;
  var uri = Uri.parse(url);
  print(prefs.getString("jwt"));

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
      "Authorization": "${prefs.getString("jwtType")} ${prefs.getString("jwt")}"
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    print(response.statusCode);
    String url = json.decode(response.body)['data']['pdf'];
    print(url);
    // ignore: use_build_context_synchronously
    launchUrl(url, context);

    return "Success";
  } else {
    throw json.decode(response.body)["error"];
  }
}
