// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/coupon/ui/coupon_page.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/purchase_coupon.dart';
import 'package:ninecoin/utilities/dialogs/successful_purchase.dart';
import '../api/coupon.dart';

import 'package:http/http.dart' as http;

class ActiveCouponDetails extends StatefulWidget {
  final int id;
  const ActiveCouponDetails(this.id);

  @override
  State<ActiveCouponDetails> createState() => _ActiveCouponDetailsState();
}

class _ActiveCouponDetailsState extends State<ActiveCouponDetails> {
  late String title = " ";
  late String Userid;
  late String purchasecondition = "";
  Coupon getdata = new Coupon();
  late double font1;
  late double font2;
  late double font3;
  late double font4;

  @override
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

  // ···

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    font1 = size.width * 1.0;
    font2 = size.height * 0.1;
    font3 = size.height * 0.2;
    font4 = size.height * 0.3;

    return SafeArea(
      child: FutureBuilder<List>(
        future: getdata.getString(widget.id.toString()),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    snapshot.data![0]['name'].toString(),
                    style: CoinTextStyle.title3Bold,
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                                child: Image.network(
                                    snapshot.data![0]['imageurl'].toString())),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          snapshot.data![0]['title'].toString(),
                          style: CoinTextStyle.title3Bold.copyWith(
                              color: CoinColors.orange, fontSize: font1),
                        ),
                        Text(snapshot.data![0]['email'].toString()),
                        Text(snapshot.data![0]['phonenumber'].toString()),
                        Text(
                          snapshot.data![0]['address'].toString(),
                          style: CoinTextStyle.title4,
                        ),
                        const SizedBox(height: 12),
                        const Divider(thickness: 2),
                        const SizedBox(height: 12),
                        Text("Our Service",
                            style: CoinTextStyle.title3Bold
                                .copyWith(color: CoinColors.orange)),
                        Text(snapshot.data![0]['servicename'].toString()),
                        const SizedBox(height: 12),
                        const Divider(thickness: 2),
                        const SizedBox(height: 12),
                        Text(
                          "Term and Condition",
                          style: CoinTextStyle.title3Bold
                              .copyWith(color: CoinColors.orange),
                        ),
                        Column(
                          children: <Widget>[
                            for (int i = 0;
                                i < snapshot.data![0]['servicecount'];
                                i++)
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(height: 6),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            snapshot.data![0]
                                                ['tnc_' + i.toString()],
                                            style: CoinTextStyle.title4),
                                      ),
                                      const SizedBox(height: 6),
                                    ],
                                  )
                                ],
                              )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(thickness: 2),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Original Point",
                                  style: CoinTextStyle.title3Bold.copyWith(
                                      color: CoinColors.black26,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  snapshot.data![0]['originalpoint'].toString(),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      decorationThickness: 2,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 35,
                                      color: CoinColors.orange,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Promotion Point",
                                  style: CoinTextStyle.title3Bold.copyWith(
                                      color: CoinColors.black26,
                                      fontWeight: FontWeight.w900),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      snapshot.data![0]['promotionpoint']
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 35,
                                          color: CoinColors.orange,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Point",
                                      style: CoinTextStyle.title1Bold,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(thickness: 2),
                        const SizedBox(height: 12),
                        Text(
                          "Expired Date",
                          textAlign: TextAlign.center,
                          style: CoinTextStyle.title3
                              .copyWith(color: CoinColors.orange),
                        ),
                        Text(
                          snapshot.data![0]['SEdate'].toString(),
                          textAlign: TextAlign.center,
                          style: CoinTextStyle.title3,
                        ),
                        const SizedBox(height: 36),
                        ElevatedButton(
                          onPressed: () async {
                            //Future<int?> id = getdata.getUserId();

                            if (await showPurchaseCouponDialog(context)) {
                              //  print(await showPurchaseCouponDialog(context));

                              getdata.PurchaseCoupon(Userid,
                                      snapshot.data![0]['id'].toString())
                                  .then((value) async {
                                print(value);
                                if (await showSuccessfulCouponDialog(
                                    context, value)) {
                                  Navigator.push(
                                      context, PurchasedDiscountCopoun.route());
                                }
                              });
                            }
                          },
                          child: const Text("Purchase"),
                        ),
                      ],
                    ),
                  ),
                ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
