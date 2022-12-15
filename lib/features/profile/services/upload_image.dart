import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../config/config.dart';

Future<String> uploadImage(filepath) async {
  var url = Api.uploadimage;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('jwtType')! + " " + prefs.getString('jwt')!;

  var request = http.MultipartRequest('POST', Uri.parse(url));

  request.files.add(http.MultipartFile.fromBytes(
      'profile_pic', File(filepath).readAsBytesSync(),
      filename: filepath.split("/").last));
  request.headers['Authorization'] = token;

  var res = await request.send();
  if (res.statusCode == 200) {
    return "image uploaded sucessfully";
  } else {
    throw "image not  uploaded sucessfully";
  }

}


