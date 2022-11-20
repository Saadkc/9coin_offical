import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class CategoryCircularCard extends StatelessWidget {
  final String imageUrl;
  final String label;
  final Color color;
  final String imageurl;
  final Function() onTap;
  const CategoryCircularCard({
    Key? key,
    required this.imageUrl,
    required this.color,
    required this.label,
    required this.onTap,
    required this.imageurl,
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
                ? Image.asset(imageUrl, height: 40, width: 40)
                : Image.network(imageurl, height: 40, width: 40, loadingBuilder:
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
                  }, errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                    return Image.asset(imageUrl, height: 40, width: 40);
                  }),
          ),
          Text(label,
              style: CoinTextStyle.title3.copyWith(color: CoinColors.white)),
        ],
      ),
    );
  }
}
