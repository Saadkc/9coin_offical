import 'package:flutter/material.dart';
import 'package:ninecoin/typography/text_styles.dart';

class NotificationTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final String date;

  const NotificationTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: Text(title, style: CoinTextStyle.title3Bold),
          subtitle: Text(subtitle, style: CoinTextStyle.title4),
          trailing: Text(date),
        ),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }
}
