import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/notification/components/circle_notification_tile.dart';
import 'package:ninecoin/features/notification/components/notification_tile.dart';
import 'package:ninecoin/typography/text_styles.dart';

import '../../../model/notification/notification_model.dart';

class NotificationPage extends StatelessWidget {
  static route(NotificationModel notification) {
    return MaterialPageRoute(
        builder: (context) => NotificationPage(
              notification: notification,
            ));
  }

  final NotificationModel notification;

  const NotificationPage({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notification",
          style: CoinTextStyle.title1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView.builder(
            itemCount: notification.data.length,
            itemBuilder: (context, index) {
              return NotificationTile(
                icon: CircleNotificationIcon(
                    icon: Badge(
                      position: BadgePosition.topEnd(top: -2),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    color: CoinColors.orange),
                title: notification.data[index].notifiableType,
                subtitle: notification.data[index].data,
                date: "28/4/2022",
              );
            }),
      ),
    );
  }
}
