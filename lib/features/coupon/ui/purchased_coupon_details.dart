import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';

import '../api/coupon.dart';

class PurchasedCouponDetails extends StatefulWidget {
  final int id;
  final int couponid;
  const PurchasedCouponDetails(this.id, this.couponid);

  @override
  State<PurchasedCouponDetails> createState() => _PurchasedCouponDetailsState();
}

class _PurchasedCouponDetailsState extends State<PurchasedCouponDetails> {
  Coupon getdata = Coupon();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List>(
        future: getdata.getString(widget.couponid.toString()),
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
                      Container(
                        padding: const EdgeInsets.only(top: 8),
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![0]['title'].toString(),
                              style: CoinTextStyle.title3Bold
                                  .copyWith(color: CoinColors.orange),
                            ),
                            Text(snapshot.data![0]['email'].toString()),
                            Text(snapshot.data![0]['phonenumber'].toString()),
                            Text(
                              snapshot.data![0]['address'].toString(),
                              style: CoinTextStyle.title4,
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text("Our Service",
                              style: CoinTextStyle.title3Bold
                                  .copyWith(color: CoinColors.orange)),
                          Text(snapshot.data![0]['servicename'].toString()),
                          const SizedBox(height: 10),
                        ],
                      ),
                      const Divider(thickness: 2),
                      Container(
                        padding: const EdgeInsets.only(top: 7),
                        height: 220,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Term and Condition",
                              style: CoinTextStyle.title3Bold
                                  .copyWith(color: CoinColors.orange),
                            ),
                            FutureBuilder<List>(
                              future: getdata.GetTnC(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  print(snapshot.data?.length);
                                  return Column(
                                    children: <Widget>[
                                      for (int i = 0;
                                          i < snapshot.data!.length;
                                          i++)
                                        Column(
                                          children: [
                                            const SizedBox(height: 6),
                                            Text(
                                                snapshot.data![i]['description']
                                                    .toString(),
                                                style: CoinTextStyle.title4),
                                            const SizedBox(height: 6),
                                          ],
                                        )
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
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
                                  style: TextStyle(
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
                                      style: TextStyle(
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
                      ),
                      const Divider(thickness: 2),
                      const SizedBox(height: 5),
                      Text(
                        "Expired Date",
                        textAlign: TextAlign.center,
                        style: CoinTextStyle.title3Bold
                            .copyWith(color: CoinColors.orange),
                      ),
                      Text(
                        "1/5/2022 - 31/5/2022",
                        textAlign: TextAlign.center,
                        style: CoinTextStyle.title3,
                      ),
                      const SizedBox(height: 5),
                      const Divider(thickness: 2),
                      const SizedBox(height: 9),
                      Text(
                        "Coupon Code",
                        textAlign: TextAlign.center,
                        style: CoinTextStyle.title3Bold
                            .copyWith(color: CoinColors.orange),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.id.toString(),
                        textAlign: TextAlign.center,
                        style: CoinTextStyle.title1,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "When you come to the store,\nplease show the coupon code to the clerk.",
                        textAlign: TextAlign.center,
                        style: CoinTextStyle.title4.copyWith(
                          color: CoinColors.green,
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
