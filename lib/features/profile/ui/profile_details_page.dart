import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/features/profile/components/circular_icon.dart';
import 'package:ninecoin/features/profile/components/edit_profile_tile.dart';
import 'package:ninecoin/features/profile/components/profile_circular_picture.dart';
import 'package:ninecoin/features/profile/components/profile_tile.dart';
import 'package:ninecoin/features/profile/services/get_image.dart';
import 'package:ninecoin/features/profile/services/profile_imagemodel.dart';
import 'package:ninecoin/features/profile/ui/edit_profile_page.dart';
import 'package:ninecoin/typography/text_styles.dart';

class ProfileDetailsPage extends StatefulWidget {
  static Route<ProfileDetailsPage> route(Map<dynamic, dynamic>? data) {
    return MaterialPageRoute(
        builder: (context) => ProfileDetailsPage(data: data));
  }

  Map? data;
  ProfileDetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  
  Future<ImageGet> getUserImage() async {
     var http;
     var responce = await http.get(Uri.parse(
        'http://9coinapi.ap-southeast-1.elasticbeanstalk.com/api/profile_pic'));
        // setState(() {
        //   profileImageModel = profileImageModel.fromJson(responce[])
        // });

    if (responce.statusCode == 200) {


        return ImageGet.fromJson(json.decode(responce.body));
    }
    else{
       throw responce.body;
    }

  }
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
                  imageUrl: widget.data!['profile_photo_url'].toString(),
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
