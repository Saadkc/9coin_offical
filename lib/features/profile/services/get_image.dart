import 'dart:convert';

import 'package:ninecoin/config/config.dart';
import 'package:ninecoin/features/profile/services/profile_imagemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<ImageGet> getUserImage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('jwtType')! + " " + prefs.getString('jwt')!;


  var responce = await http.get(
      Uri.parse(
        Api.getuserimage
         ),
      headers: {'Authorization': token});

  if (responce.statusCode == 200) {
    return ImageGet.fromJson(json.decode(responce.body));
  } else {
    throw responce.body;
  }
}

