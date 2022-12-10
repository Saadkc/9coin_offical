 import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



Future<String> uploadImage(File? image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();
    var uri = Uri.parse(
        'http://9coinapi.ap-southeast-1.elasticbeanstalk.com/api/upload_pic?profile_pic');
    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    // Map<String, String> headers = { "Accesstoken": "access_token"};
    String token = prefs.getString('jwtType')! + " " + prefs.getString('jwt')!;
    print(token);
    request.headers['Authorization'] = token;

    // MultipartRequest.headers.addAll(headers);
    // MultipartRequest.files.add();
    request.fields['profile_pic'] = "Image data";
    var multiport = http.MultipartFile('_image', stream, length);
    request.files.add(multiport);
    var response = await request.send();
    
    if(response.statusCode ==200){
    
      
  return "Success";
    } else {
      throw "Image not upload";
    }
  }
