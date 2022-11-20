import 'package:flutter/material.dart';

class CircleNotificationIcon extends StatelessWidget {
  const CircleNotificationIcon({Key? key, this.icon, required this.color})
      : super(key: key);
  final Widget? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      // padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: icon,
    );
  }
}
