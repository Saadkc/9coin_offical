import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/auth/ui/login_page.dart';
import 'package:ninecoin/features/profile/components/profile_circular_picture.dart';
import 'package:ninecoin/features/profile/components/profile_tile.dart';
import 'package:ninecoin/features/profile/services/profile_service.dart';
import 'package:ninecoin/features/profile/ui/helps_page.dart';
import 'package:ninecoin/features/profile/ui/profile_details_page.dart';
import 'package:ninecoin/features/profile/ui/qr_code_page.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/logout_account.dart';
import 'package:ninecoin/utilities/dialogs/logout_successful.dart';
import 'package:ninecoin/utilities/dialogs/new_password_reset.dart';
import 'package:ninecoin/utilities/dialogs/password_reset.dart';
import 'package:ninecoin/widgets/lucky_draw_information_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/ui/change_password.dart';

class ProfilePage extends StatefulWidget {
  static Route<ProfilePage> route() {
    return MaterialPageRoute(builder: (_) => const ProfilePage());
  }

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<dynamic, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile", style: CoinTextStyle.title1Bold),
          elevation: 0,
        ),
        body: ListView(
          children: [
            FutureBuilder(
                future: localUser(),
                builder: (_, AsyncSnapshot<Map?> snapshot) {
                  if (snapshot.hasData) {
                    String imageUrl =
                        snapshot.data!['profile_photo_url'].toString();
                    data = snapshot.data;
                    return Container(
                      padding: const EdgeInsets.fromLTRB(18, 16, 18, 28),
                      alignment: Alignment.centerLeft,
                      color: CoinColors.black12,
                      child: Row(
                        children: [
                          ProfileCircularPicture(imageUrl: imageUrl),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ID:${snapshot.data!['id']}",
                                    style: CoinTextStyle.title4
                                        .copyWith(color: CoinColors.orange)),
                                Text("${snapshot.data!['name']}",
                                    style: CoinTextStyle.title1Bold),
                                Text("${snapshot.data!['email']}"),
                                const SizedBox(height: 6),
                                Row(
                                  textBaseline: TextBaseline.alphabetic,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  children: [
                                    Text("${snapshot.data!['point']}",
                                        style: CoinTextStyle.title1Bold
                                            .copyWith(
                                                color: CoinColors.orange,
                                                fontSize: 22)),
                                    const SizedBox(width: 2),
                                    Text("Point", style: CoinTextStyle.title5)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
            ProfileTile(
              imageUrl: Assets.profileIcon,
              title: "Profile Details",
              onTap: () {
                Navigator.push(context, ProfileDetailsPage.route(data));
              },
            ),
            ProfileTile(
              imageUrl: Assets.changePassword2,
              title: "Change Password",
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePasswordPage()));
              },
            ),
            ProfileTile(
              imageUrl: Assets.qrcode,
              title: "QR Code",
              onTap: () {
                Navigator.push(context, QrCodePage.route());
              },
            ),
            ProfileTile(
              imageUrl: Assets.information,
              title: "Lucky Draw Information",
              onTap: () {
                Navigator.push(context, LuckDrawInformationPage.route());
              },
            ),
            ProfileTile(
              imageUrl: Assets.help2,
              title: "Help",
              onTap: () {
                Navigator.push(context, HelpsPage.route());
              },
            ),
            ProfileTile(
              imageUrl: Assets.logout,
              title: "Logout",
              isShowDivider: false,
              onTap: () async {
                if (await showLogoutAccountDialog(context)) {
                  if (await showSuccessfulLogoutDialog(context)) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    prefs.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  }
                }
              },
            ),
          ],
        ));
  }
}
