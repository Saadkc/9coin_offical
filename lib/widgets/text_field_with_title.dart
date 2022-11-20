import 'package:flutter/material.dart';
import 'package:ninecoin/typography/text_styles.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String title;
  final String hintText;
  const TextFieldWithTitle({
    Key? key,
    required this.title,
    required this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
            child: Text(title, style: CoinTextStyle.orangeTitle3),
          ),
          TextField(
            decoration: InputDecoration(hintText: hintText),
          ),
        ],
      ),
    );
  }
}
