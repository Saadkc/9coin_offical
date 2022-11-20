import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class EditProfileTile extends StatelessWidget {
  final String imageUrl;
  final String title1;
  final String title2;
  final bool isShowDivider;
  final Function()? onTap;
  const EditProfileTile({
    Key? key,
    required this.imageUrl,
    required this.title1,
    required this.title2,
    this.isShowDivider = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                imageUrl,
                height: 22,
                width: 22,
              ),
              title: Text(
                title1,
                style: CoinTextStyle.title4.copyWith(color: CoinColors.black54),
              ),
              subtitle: Text(title2, style: CoinTextStyle.title4),
            ),
            const SizedBox(height: 4),
            isShowDivider ? const Divider() : const Opacity(opacity: 0),
          ],
        ),
      ),
    );
  }
}
