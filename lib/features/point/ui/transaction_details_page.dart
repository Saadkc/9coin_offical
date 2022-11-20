import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';

class TranctionDetailsPage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (_) => const TranctionDetailsPage());
  }

  const TranctionDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("28/4/2022"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Package 2", style: CoinTextStyle.title3),
            const SizedBox(height: 3.0),
            Text(
                '''Mauris non ligula tempus, lacinia velit a, aliquam metus. Nulla at sapien scelerisque, imperdiet ex non,venenatis mi.''',
                style: CoinTextStyle.title4),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 15),
            const Text("Payment Method"),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.5),
                  child: Image.asset(Assets.pfx,
                      height: 22, width: 56, fit: BoxFit.cover),
                ),
                const SizedBox(width: 15),
                Text("Online Banking Payment", style: CoinTextStyle.title3),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "20",
                    style: CoinTextStyle.orangeTitle1.copyWith(fontSize: 30),
                    children: [
                      TextSpan(
                        text: " Point",
                        style: CoinTextStyle.title1,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Total :",
                    style: CoinTextStyle.title2,
                    children: [
                      TextSpan(
                        text: " RM 65",
                        style: CoinTextStyle.orangeTitle1.copyWith(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
