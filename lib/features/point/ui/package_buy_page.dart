import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/point/api/pointpackage.dart';
import 'package:ninecoin/features/point/ui/package_payment_page.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/config.dart';

class PackageBuyPage extends StatefulWidget {
  static route(
      {required pointpackageresponse pointpackage, required int index}) {
    return MaterialPageRoute(builder: (context) {
      return PackageBuyPage(pointpackage: pointpackage, index: index);
    });
  }

  final pointpackageresponse pointpackage;
  final int index;

  const PackageBuyPage(
      {Key? key, required this.pointpackage, required this.index})
      : super(key: key);

  @override
  State<PackageBuyPage> createState() => _PackageBuyPageState();
}

class _PackageBuyPageState extends State<PackageBuyPage> {
  late String Userid = "";
  pointpackage getdata = new pointpackage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata.getUserId().then((value) {
      setState(() {
        Userid = value.toString();
        print(Userid);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.pointpackage.data[widget.index].name),
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
                  Text(widget.pointpackage.data[widget.index].name,
                      style: CoinTextStyle.title3),
                  const SizedBox(height: 3.0),
                  Text(widget.pointpackage.data[widget.index].description,
                      style: CoinTextStyle.title4),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: widget.pointpackage.data[widget.index].point
                              .toString(),
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
                              text: "RM " +
                                  widget.pointpackage.data[widget.index].myr,
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
                  Text("Term and Condition",
                      style: CoinTextStyle.title3Bold
                          .copyWith(color: CoinColors.dialogTextColor)),
                  const SizedBox(height: 6.0),
                  Text(
                      "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: CoinTextStyle.title4),
                  const SizedBox(height: 6.0),
                  Text(
                      "2. Proin et orci in quam porta condimentum. Mauris non ligula tempus, lacinia velit a, aliquam metus.",
                      style: CoinTextStyle.title4),
                  const SizedBox(height: 6.0),
                  Text(
                      "3. Nulla atone sapien scelerisque, imperdiet exq non, venenatis mi.",
                      style: CoinTextStyle.title4),
                  const SizedBox(height: 6.0),
                  Text(
                      "4. Nullam arcu leo, blandit nec consequat vel, molestie et sem.",
                      style: CoinTextStyle.title4),
                  const SizedBox(height: 6.0),
                  Text(
                      "5. Praesent pretium erat at nulla euismod, a rutrum elit blandit. Etiam nec aliquam metus.",
                      style: CoinTextStyle.title4),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String url = Api.buypointpackage +
                    "/" +
                    Userid.toString() +
                    "/" +
                    widget.pointpackage.data[widget.index].id.toString();
                //   const url = 'https://www.google.com';
                if (!await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                )) {}
                throw 'Could not launch $url';
              },
              child: const Text("Pay"),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
