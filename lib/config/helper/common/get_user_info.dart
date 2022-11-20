import 'package:shared_preferences/shared_preferences.dart';

Future<int> getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt("userId")!;
}
