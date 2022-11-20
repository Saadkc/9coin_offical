import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class ProfileTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isShowDivider;
  final Function()? onTap;
  const ProfileTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.isShowDivider = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 24, 18, 0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(imageUrl,
                    height: 20, width: 20, color: CoinColors.orange),
                const SizedBox(width: 24),
                Text(title, style: CoinTextStyle.title4)
              ],
            ),
            const SizedBox(height: 20),
            isShowDivider ? const Divider() : const Opacity(opacity: 0),
          ],
        ),
      ),
    );
  }
}
