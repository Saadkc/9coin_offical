import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../typography/text_styles.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String imageUrl,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
}) {
  final options = optionsBuilder();
  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Column(
          children: [
            Image.asset(imageUrl,
                height: 52, width: 52, color: CoinColors.orange),
            const SizedBox(height: 12.0),
            Text(
              title,
              style: CoinTextStyle.title3Bold
                  .copyWith(color: CoinColors.dialogTextColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: CoinTextStyle.title4,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actionsOverflowButtonSpacing: 0,
        contentPadding: const EdgeInsets.fromLTRB(38.0, 6.0, 38.0, 8.0),
        titlePadding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
        actionsPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 28.0),
        actions: options.keys.map((optionTitle) {
          final value = options[optionTitle];
          return InkWell(
            onTap: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              width: 78,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: options.length > 1
                    ? value
                        ? CoinColors.dialogTextColor
                        : CoinColors.red
                    : CoinColors.dialogTextColor,
              ),
              child: Text(
                optionTitle,
                style: CoinTextStyle.title4Bold,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
      );
    },
  );
}
