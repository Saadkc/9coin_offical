import 'package:flutter/material.dart';

import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';

class ProfileCircularPicture extends StatelessWidget {
  const ProfileCircularPicture({
    Key? key,
    this.onTap,
    this.imageUrl,
    this.isShowSelectImage = false,
  }) : super(key: key);

  final Function()? onTap;
  final String? imageUrl;
  final bool isShowSelectImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        
        border: Border.all(
          color: CoinColors.orange,
          width: 1.4,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 90,
          width: 90,
          child: ClipOval(
              child: isShowSelectImage
                  ? Container(
                      decoration: BoxDecoration(
                        color: CoinColors.black,
                        image: DecorationImage(
                          opacity: 0.2,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            imageUrl ?? Assets.profile,
                          ),
                        ),
                      ),
                      child: const Icon(Icons.camera_alt,
                          color: CoinColors.white, size: 26),
                    )
                  : Image.network(imageUrl ?? Assets.profile,
                      fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
