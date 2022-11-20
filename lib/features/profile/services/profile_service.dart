import 'package:ninecoin/config/helper/auth_helper/auth_helper.dart';

Future<Map<dynamic, dynamic>?> localUser() async {
  return await getLocalUser();
}
