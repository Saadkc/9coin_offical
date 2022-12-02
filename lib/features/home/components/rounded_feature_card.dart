import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class RoundedFeatureCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String pNumber;
  final String location;
  final Function() onTap;

  const RoundedFeatureCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.pNumber,
      required this.location,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            width: 172,
            height: 200,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: CoinColors.black,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                            child: Image.network(imageUrl, fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            }, errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                              return Center(child: CircularProgressIndicator());
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(title,
                            style: CoinTextStyle.title4.copyWith(
                                color: CoinColors.orange,
                                fontWeight: FontWeight.w600)),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.phone, size: 10.0),
                          ),
                          Text(pNumber, style: CoinTextStyle.title5),
                        ],
                      ),
                      // SizedBox(
                      //   height: 2,
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            child: Icon(Icons.location_on_rounded, size: 12.0),
                          ),
                          Flexible(
                            child: Text(location, style: CoinTextStyle.title5),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
