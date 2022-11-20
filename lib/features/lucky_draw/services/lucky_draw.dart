import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/config.dart';
import '../../../model/luckyDraw/lucky_draw_response.dart';
import '../../../model/luckyDraw/lucky_drawn_response.dart';

class Luckydraw {
  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    int? intvalue = prefs.getInt('userId');
    // print(intvalue);
    return intvalue;
  }

  Future<List> getLuckydraw(String id) async {
    String url = Api.getluckydrawlist + "/" + id;

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getluckydrawwin(String id) async {
    String url = Api.getluckydrawwinner + "/" + id;

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getLuckydrawInfo(String id) async {
    String url = Api.getluckydrawinfo + "/" + id;
    print(url);
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> updatedrawnstatus(String id) async {
    String url = Api.updateluckydrawredeem + "/" + id;
    print(url);
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return "sucess";
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

Future<LuckyDrawResponse> getLuckyDrawInfo(String id) async {
  String url = Api.getluckydrawinfos + "/" + id;
  print(url);
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return LuckyDrawResponse.fromJson(json.decode(response.body));
  } else {
    throw json.decode(response.body)["error"];
  }
}

Future<LuckyDrawListResponse> getLuckyDrawListInfo(String id) async {
  String url = Api.getluckydrawlists + "/" + id;
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return LuckyDrawListResponse.fromJson(json.decode(response.body));
  } else {
    throw json.decode(response.body)["error"];
  }
}

Future<LuckyDrawResponse> getLuckyDraw(String id) async {
  String url = Api.getLuckyDraw + '/' + id;

  print(url);
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return LuckyDrawResponse.fromJson(json.decode(response.body));
  } else {
    throw json.decode(response.body)["error"];
  }
}

Future<LuckyDrawnResponse> getLuckyDrawn(String userId) async {
  String url = Api.getLuckyDrawn + userId;
  print(url);
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    print(json.decode(response.body));
    return LuckyDrawnResponse.fromJson(json.decode(response.body));
  } else {
    throw json.decode(response.body)["error"];
  }
}

Future<String> buyluckydraw(
    String userid, String luckydrawid, int amount) async {
  String url = Api.buyluckydraw +
      "/" +
      userid +
      "/" +
      luckydrawid +
      "/" +
      amount.toString();
  /*String url =
      "${Api.updatePartcipants}?lucky_draw_id=$luckydrawid&participants[]=$userid";*/
  var uri = Uri.parse(url);
  print(url);
  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body)['data']['message'];
    } else {
      throw json.decode(response.body)['data']["message"];
    }
  } catch (e) {
    return Future.error(e);
  }

  var response = await http.put(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return "Success";
  } else {
    throw json.decode(response.body)["error"];
  }
}

Future<String> putLuckyDraw(String luckyDrawId, String userId) async {
  String url =
      "${Api.updatePartcipants}?lucky_draw_id=$luckyDrawId&participants[]=$userId";
  var uri = Uri.parse(url);

  var response = await http.put(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return "Success";
  } else {
    throw json.decode(response.body)["error"];
  }
}

Future<List> getWinner() async {
  String url = Api.getLuckyDraw;
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return json.decode(response.body)['data'];
  } else {
    throw json.decode(response.body)["error"];
  }
}
