import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';

class CircularIcon extends StatelessWidget {
  final Widget icon;
  final Function() onTap;

  const CircularIcon({Key? key, required this.icon, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: CoinColors.black,
        ),
        child: icon,
      ),
    );
  }
}
