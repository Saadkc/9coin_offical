import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/config.dart';
import '../../../model/news/news_model.dart';

class Merchant {
  String url = Api.merchant;
  String urltest = "http://127.0.0.1:7070/api/coupon_list";

  Future<List> getmerchantlist(String category) async {
    String url = Api.merchant + '/' + category;
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

  Future<List> searchresult(String search) async {
    String url = Api.searchmerchant + '/' + search;
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

  Future<List> Featuremerchant() async {
    String url = Api.getmerchant;

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

  Future<GetNews> FeatureNews() async {
    String url = Api.newslist;
    var uri = Uri.parse(url);

    var response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return GetNews.fromJson(json.decode(response.body));
    } else {
      throw json.decode(response.body)["error"];
    }
  }

  Future<List> GetTnC() async {
    String url = Api.termandcondition;

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> GetpurchasedDetail(String id) async {
    String url = Api.purchasecouponlist + '/' + id;
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

  Future<List> getString(String id) async {
    String url = Api.merchantdetail + "/" + id;
    print(url);
    String urltest = "http://127.0.0.1:7070/api/getcoupondetail/" + id;

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // print(jsonDecode(response.body));
        //  print(jsonDecode(response.body)['Url']);
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    int? intvalue = prefs.getInt('userId');
    // print(intvalue);
    return intvalue;
  }

  Future<String> PurchaseCoupon(String id, String Couponid) async {
    String url = Api.purchasecoupon + "/" + id + "/" + Couponid;

    String urltest =
        "http://127.0.0.1:7070/api/purchase_coupon/" + id + "/" + Couponid;

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // print(jsonDecode(response.body)['data']['message']);
        //print(jsonDecode(response.body)['Url']);
        // print(jsonDecode(response.body));
        return jsonDecode(response.body)['data']['message'];
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
