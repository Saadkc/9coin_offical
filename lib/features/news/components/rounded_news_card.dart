import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class RoundedNewsCard extends StatelessWidget {
  final String imageUrl;
  final String date;
  final String title;
  final String desc;
  final Function() onTap;
  const RoundedNewsCard({
    Key? key,
    required this.imageUrl,
    required this.date,
    required this.title,
    required this.desc,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        constraints:
            const BoxConstraints.expand(height: 268, width: double.infinity),
        decoration: BoxDecoration(
            color: CoinColors.fullBlack,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fitWidth,
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
                  ),
                )),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(date,
                        style: CoinTextStyle.title4
                            .copyWith(color: CoinColors.black54)),
                    Text(
                      title,
                      style: CoinTextStyle.title3Bold.copyWith(
                        color: CoinColors.orange,
                      ),
                    ),
                    Text(desc, style: CoinTextStyle.title5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
