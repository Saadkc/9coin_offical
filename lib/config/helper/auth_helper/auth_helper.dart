import 'package:ninecoin/model/auth/login/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../features/profile/services/profile_imagemodel.dart';
import '../../../model/auth/register/register_response.dart';
import 'package:http/http.dart' as http;

void setUser(RegisterResponse user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("userId", user.success.id!);
  // prefs.setString("userId", user.!);
  // prefs.setInt("userId", user.success.id!);
}

void setLoginUserInfo(LoginResponse user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("userId", user.data.id);
  prefs.setString("jwt", user.accessToken);
  prefs.setString("jwtType", user.tokenType);
  prefs.setString("data", json.encode(user.data));
}

void setUserInfo(GetUserData user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString("data", json.encode(user.data));
}

Future<Map<dynamic, dynamic>?> getLocalUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = json.decode(prefs.getString("data")!);
  if (user.toString().isEmpty) {
    return null;
  } else {
    Data data = Data.fromJson(user);
    return data.toJson();
  }
}

// Future<ImageGet> getUserImage() async {
//   var responce = await http.get(Uri.parse(
//       'http://9coinapi.ap-southeast-1.elasticbeanstalk.com/api/profile_pic'));

//   if (responce.statusCode == 200) {
//     return ImageGet.fromJson(json.decode(responce.body));
//   } else {
//     throw responce.body;
//   }
// }

Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("jwt");
  return token!;
}
