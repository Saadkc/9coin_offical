import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class CirlceCategoryIcon extends StatelessWidget {
  final String imageUrl;
  final String imageurl;
  final String label;
  final Color color;
  final Function() onTap;
  const CirlceCategoryIcon({
    Key? key,
    required this.imageUrl,
    required this.imageurl,
    required this.color,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(6.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: imageurl == 'null'
                ? Image.asset(imageUrl, height: 35, width: 35)
                : Image.network(imageurl, loadingBuilder: (BuildContext context,
                    Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }, errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                    return Center(child: CircularProgressIndicator());
                  }, height: 35, width: 35),
          ),
          Text(label,
              style: CoinTextStyle.title3.copyWith(color: CoinColors.white)),
        ],
      ),
    );
  }
}
