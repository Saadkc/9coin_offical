import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class BuyPointCardTile extends StatelessWidget {
  final String packageNum;
  final int point;
  final String pointDetail;
  final Function() onTap;
  const BuyPointCardTile(
      {Key? key,
      required this.onTap,
      required this.packageNum,
      required this.point,
      required this.pointDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      color: CoinColors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          trailing: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              decoration: BoxDecoration(
                  color: CoinColors.dialogTextColor,
                  borderRadius: BorderRadius.circular(6.0)),
              child: Text("Buy", style: CoinTextStyle.title3),
            ),
          ),
          title: Text(packageNum, style: CoinTextStyle.title3Bold),
          subtitle: RichText(
            text: TextSpan(
              style: CoinTextStyle.title3Bold.copyWith(
                color: CoinColors.dialogTextColor,
                height: 2,
              ),
              text: "$point",
              children: [
                const TextSpan(
                  text: " ",
                ),
                TextSpan(
                  style: CoinTextStyle.title3,
                  text: "Point",
                ),
                const TextSpan(
                  text: " ",
                ),
                const TextSpan(
                  style: TextStyle(color: CoinColors.white),
                  text: "-",
                ),
                const TextSpan(
                  text: " ",
                ),
                TextSpan(
                  style: CoinTextStyle.title3Bold
                      .copyWith(color: CoinColors.dialogTextColor),
                  text: pointDetail,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
