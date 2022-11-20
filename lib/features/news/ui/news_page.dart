import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/news/components/rounded_news_card.dart';
import 'package:ninecoin/features/news/services/news.dart';

import '../../../model/news/news_model.dart';
import 'news_details_page.dart';

// ignore: must_be_immutable
class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  late GetNews news;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CoinColors.black,
      child: FutureBuilder<GetNews>(
        future: getNews(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          news = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: news.data.length,
            itemBuilder: (context, index) {
              return RoundedNewsCard(
                onTap: () {
                  Navigator.push(
                      context, NewsDetailsPage.route(news: news, index: index));
                },
                imageUrl: news.data[index].photo,
                date: news.data[index].date,
                title: news.data[index].name,
                desc: news.data[index].description,
              );
            },
          );
        },
      ),
    );
  }
}
