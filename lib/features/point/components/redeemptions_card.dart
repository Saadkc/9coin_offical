import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class RedeemptionsCard extends StatelessWidget {
  final String title;
  final String name;
  final String address;
  final String point;
  final Color buttonColor;
  final String buttonText;
  final String imageUrl;
  final String redeemstatus;
  final Function()? onTap;
  const RedeemptionsCard({
    Key? key,
    required this.point,
    required this.address,
    required this.name,
    required this.title,
    required this.redeemstatus,
    this.buttonText = "Redeem",
    this.buttonColor = CoinColors.dialogTextColor,
    this.onTap,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      height: 268,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CoinColors.mediumBlack,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
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
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title, style: CoinTextStyle.orangeTitle2),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Image.asset(Assets.shop, height: 14, width: 14),
                    const SizedBox(width: 12),
                    Text(title, style: CoinTextStyle.title4)
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Assets.address, height: 14, width: 14),
                      const SizedBox(width: 12),
                      Flexible(
                          child: Text(address, style: CoinTextStyle.title4)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: point,
                          style:
                              CoinTextStyle.orangeTitle1.copyWith(fontSize: 26),
                          children: [
                            TextSpan(
                              style: CoinTextStyle.orangeTitle5,
                              text: " Point",
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: onTap,
                        child: Container(
                          alignment: Alignment.center,
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(buttonText),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
