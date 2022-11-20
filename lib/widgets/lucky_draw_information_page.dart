import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class LuckDrawInformationPage extends StatelessWidget {
  static Route<LuckDrawInformationPage> route() {
    return MaterialPageRoute(
        builder: (context) => const LuckDrawInformationPage());
  }

  const LuckDrawInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Lucky Draw Information",
              style: CoinTextStyle.title2Bold,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "How To Use a Lucky Draw",
                  style: CoinTextStyle.title2Bold.copyWith(
                    color: CoinColors.orange,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Mauris non ligula tempus, lacinia velit a, aliquam metus. Nulla at sapien scelerisque, imperdiet ex non, venenatis mi.",
                  style: CoinTextStyle.title3,
                ),
                const SizedBox(height: 35),
                Text(
                  "Please follow the steps below to enter the draw :",
                  style: CoinTextStyle.orangeTitle3,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: CoinTextStyle.title4),
                      Text(
                          "2. Proin et orci in quam porta condimentum. Mauris non ligula tempus, lacinia velit a, aliquam metus.",
                          style: CoinTextStyle.title4),
                      Text(
                          "3. Nulla atone sapien scelerisque, imperdiet exq non, venenatis mi.",
                          style: CoinTextStyle.title4),
                      Text(
                          "4. Nullam arcu leo, blandit nec consequat vel, molestie et sem.",
                          style: CoinTextStyle.title4),
                      Text(
                          "5. Praesent pretium erat at nulla euismod, a rutrum elit blandit. Etiam nec aliquam metus.",
                          style: CoinTextStyle.title4),
                      Text(
                          "6. Aliquam erat volutpat. Morbi non condimentum sapien.",
                          style: CoinTextStyle.title4)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
