import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/payment_successful_dialog.dart';

class PackagePaymentPage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (_) => const PackagePaymentPage());
  }

  const PackagePaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Package 2", style: CoinTextStyle.title3),
                  const SizedBox(height: 3.0),
                  Text('''Mauris non ligula tempus, lacinia velit a, aliquam
metus. Nulla at sapien scelerisque, imperdiet ex non,
venenatis mi.''', style: CoinTextStyle.title4),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "20",
                          style:
                              CoinTextStyle.orangeTitle1.copyWith(fontSize: 26),
                          children: [
                            TextSpan(
                              text: " Point",
                              style: CoinTextStyle.title2,
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
                              style: CoinTextStyle.orangeTitle1
                                  .copyWith(fontSize: 26),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 24),
                  Text("Payment Method",
                      style: CoinTextStyle.title3Bold
                          .copyWith(color: CoinColors.dialogTextColor)),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    padding: const EdgeInsets.fromLTRB(8, 24, 0, 24),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: CoinColors.black12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3.5),
                          child: Image.asset(Assets.pfx,
                              height: 22, width: 56, fit: BoxFit.cover),
                        ),
                        Text("Online Banking Payment",
                            style: CoinTextStyle.title3Bold),
                        Transform.scale(
                          scale: 1.2,
                          child: Radio(
                            activeColor: CoinColors.orange,
                            focusColor: CoinColors.orange,
                            value: 1,
                            groupValue: 1,
                            onChanged: (state) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await showPaymentSuccessfulLogoutDialog(context);
              },
              child: const Text("Pay"),
            ),
          ],
        ),
      ),
     
    );
  }
}
