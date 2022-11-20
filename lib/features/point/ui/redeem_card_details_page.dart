import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/features/point/api/productredemption.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/redeem_item_dialog.dart';
import 'package:ninecoin/utilities/dialogs/redeemed_successful_dialog.dart';

class RedeemCardDetailsPage extends StatefulWidget {
  final int id;
  const RedeemCardDetailsPage(this.id);
  @override
  State<RedeemCardDetailsPage> createState() => _RedeemCardDetailsPageState();
}

class _RedeemCardDetailsPageState extends State<RedeemCardDetailsPage> {
  ProductRedeem getdata = ProductRedeem();
  String Userid = "";

  void initState() {
    super.initState();
    getdata.getUserId().then((value) {
      setState(() {
        Userid = value.toString();
      });
    });
    //futuredata = getString("220001");
    // futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: FutureBuilder<List>(
          future: getdata.getproductdetail(widget.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(snapshot.data![0]['title'].toString()),
                ),
                body: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  children: [
                    Expanded(
                        child: Image.network(
                            snapshot.data![0]['image_url'].toString())),
                    const SizedBox(height: 12.0),
                    Text(snapshot.data![0]['name'].toString(),
                        style: CoinTextStyle.orangeTitle2),
                    const SizedBox(height: 8.0),
                    Text("Email : " + snapshot.data![0]['email'].toString(),
                        style: CoinTextStyle.title3),
                    Text(
                        "Contact Number : " +
                            snapshot.data![0]['phonenumber'].toString(),
                        style: CoinTextStyle.title3),
                    Text("Address : " + snapshot.data![0]['address'].toString(),
                        style: CoinTextStyle.title3),
                    const SizedBox(height: 12.0),
                    const Divider(),
                    const SizedBox(height: 8.0),
                    Text("Product", style: CoinTextStyle.orangeTitle3),
                    const SizedBox(height: 8.0),
                    Text(snapshot.data![0]['productname'].toString(),
                        style: CoinTextStyle.title3),
                    const SizedBox(height: 8.0),
                    const Divider(),
                    RichText(
                      text: TextSpan(
                        text: "Total :",
                        style: CoinTextStyle.title3,
                        children: [
                          TextSpan(
                            text: snapshot.data![0]['point'].toString(),
                            style: CoinTextStyle.orangeTitle1.copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: "Point",
                                style: CoinTextStyle.orangeTitle1.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 12.0),
                    Text("Term and Condition",
                        style: CoinTextStyle.orangeTitle3),
                    const SizedBox(height: 8.0),
                    Column(
                      children: <Widget>[
                        for (int i = 0;
                            i < snapshot.data![0]['servicecount'];
                            i++)
                          Column(
                            children: [
                              const SizedBox(height: 6),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    snapshot.data![0]
                                        ['service_' + i.toString()],
                                    style: CoinTextStyle.title3.copyWith(
                                      letterSpacing: 0.5,
                                    )),
                              ),
                              const SizedBox(height: 6),
                            ],
                          )
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (await showRedeemItemDialog(context)) {
                            getdata
                                .buyproduct(Userid, widget.id.toString())
                                .then((value) async {
                              if (await showRedeemedSuccessfulDialog(
                                  context)) {}
                            });
                          }
                        },
                        child: const Text("Redeem"))
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
