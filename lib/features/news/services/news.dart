import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ninecoin/model/news/news_model.dart';

import '../../../config/config.dart';

Future<GetNews> getNews() async {
  String url = Api.getNews;
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  print(url);
  if (response.statusCode == 200 || response.statusCode == 201) {
    return GetNews.fromJson(json.decode(response.body));
  } else {
    throw json.decode(response.body)["error"];
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
