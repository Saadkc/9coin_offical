import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../config/config.dart';

Future<String> uploadImage(File? image) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('jwtType')! + " " + prefs.getString('jwt')!;

      


  var stream = http.ByteStream(image!.openRead());
  stream.cast();
  var url = Api.uploadimage;
  var length = await image.length();
  var uri = Uri.parse(url);
  print(url);
  var request = await http.MultipartRequest(
    'POST',
    uri,
  );

  // Map<String, String> headers = { "Accesstoken": "access_token"};
  print(token);
  request.headers['Authorization'] = token;

  // MultipartRequest.headers.addAll(headers);
  // MultipartRequest.files.add();
  request.fields['profile_pic'] = "Image data";
  var multiport = http.MultipartFile('_image', stream, length);
  request.files.add(multiport);
  var response = await request.send();

  if (response.statusCode == 200) {
    print("saad");
    print(response.stream.first);
    
    return "Success";
  } else {
    throw "Image not upload";
  }
}
