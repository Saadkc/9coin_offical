import 'dart:convert';

import 'package:ninecoin/features/profile/services/profile_imagemodel.dart';

Future<ImageGet> getUserImage() async {
  var http;
  var responce = await http.get(Uri.parse(
      'http://9coinapi.ap-southeast-1.elasticbeanstalk.com/api/profile_pic'));

  if (responce.statusCode == 200) {
    return ImageGet.fromJson(json.decode(responce.body));
  } else {
    throw responce.body;
  }
}
