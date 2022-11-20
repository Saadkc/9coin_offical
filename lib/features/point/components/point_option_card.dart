import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class PointOptionCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function() onTap;
  const PointOptionCard(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: CoinColors.black12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8.0),
            Image.asset(imageUrl,
                color: CoinColors.white, height: 46, width: 46),
            const SizedBox(height: 8.0),
            Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: CoinTextStyle.title2Bold.copyWith(height: 1.3),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
