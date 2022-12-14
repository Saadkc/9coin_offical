import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/features/profile/components/circular_icon.dart';
import 'package:ninecoin/features/profile/components/edit_profile_tile.dart';
import 'package:ninecoin/features/profile/components/profile_circular_picture.dart';
import 'package:ninecoin/features/profile/components/profile_tile.dart';
import 'package:ninecoin/features/profile/services/get_image.dart';
import 'package:ninecoin/features/profile/ui/edit_profile_page.dart';
import 'package:ninecoin/typography/text_styles.dart';

class ProfileDetailsPage extends StatefulWidget {
  static Route<ProfileDetailsPage> route(Map<dynamic, dynamic> data,String? imageUrl) {
    return MaterialPageRoute(
        builder: (context) => ProfileDetailsPage(data: data,imageUrl: imageUrl!, ));
  }

  final String? imageUrl;
  final Map<dynamic,dynamic> data;
  const ProfileDetailsPage({Key? key, required this.data, this.imageUrl }) : super(key: key);

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {


  final Text text = Text("");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Profile Details", style: CoinTextStyle.title3Bold),
        actions: [
          CircularIcon(
              icon: Image.asset(
                Assets.edit,
                height: 14.5,
                width: 14.5,
                color: CoinColors.orange12,
              ),
              onTap: () {
                Navigator.push(context, EditProfilePage.route());
              }),
          const SizedBox(width: 20.0),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 35),
            alignment: Alignment.center,
            color: CoinColors.black12,
            child: Column(
              children: [
                ProfileCircularPicture(
                  imageUrl: widget.imageUrl != null ? widget.imageUrl : widget.data != null ? ""  : widget.data!['profile_photo_url'].toString(),
                ),
                const SizedBox(height: 10),
                Text("${widget.data!['phonenumber']}",
                    style: CoinTextStyle.title4
                        .copyWith(color: CoinColors.orange)),
                Text("${widget.data!['name']}",
                    style: CoinTextStyle.title1Bold.copyWith(fontSize: 22)),
                Text("${widget.data!['email']}"),
              ],
            ),
          ),
          EditProfileTile(
            imageUrl: Assets.gender,
            title1: "Gender",
            title2: "${widget.data!['gender']}",
          ),
          EditProfileTile(
            imageUrl: Assets.phone,
            title1: "Contact Number",
            title2: "${widget.data!['phonenumber']}",
          ),
          EditProfileTile(
            imageUrl: Assets.email,
            title1: "Address",
            title2: "${widget.data!['address']}",
            isShowDivider: false,
          ),
        ],
      ),
    );
  }
}
