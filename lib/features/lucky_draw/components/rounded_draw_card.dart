import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class RoundedDrawCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String boxTitle;
  final String date;
  final Function() onTap;
  const RoundedDrawCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
    required this.boxTitle,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        height: 260,
        width: double.infinity,
        decoration: BoxDecoration(
            color: CoinColors.mediumBlack,
            borderRadius: BorderRadius.circular(6.0)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Container(
                        color: CoinColors.black,
                        child: Image.network(imageUrl, loadingBuilder:
                            (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }, errorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                          return Center(child: CircularProgressIndicator());
                        }, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: CoinTextStyle.orangeTitle2),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Image.asset(Assets.item, height: 14, width: 14),
                      const SizedBox(width: 12.0),
                      Text(boxTitle, style: CoinTextStyle.title4),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Image.asset(Assets.date, height: 14, width: 14),
                      const SizedBox(width: 12),
                      Text(date, style: CoinTextStyle.title4),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
