import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/features/point/api/pointpackage.dart';
import 'package:ninecoin/features/point/components/buy_point_card_tile.dart';

import 'package_buy_page.dart';

class BuyPointPackagePage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (context) => BuyPointPackagePage());
  }

  BuyPointPackagePage({Key? key}) : super(key: key);
  pointpackage getdata = pointpackage();
  late pointpackageresponse pointpackageresponses;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: CoinColors.black,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Buy Point Package"),
          ),
          body: FutureBuilder<pointpackageresponse>(
            future: getdata.getpointpackage(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                pointpackageresponses = snapshot.data!;
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: pointpackageresponses.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 24),
                          BuyPointCardTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PackageBuyPage.route(
                                      pointpackage: pointpackageresponses,
                                      index: index));
                            },
                            packageNum: pointpackageresponses.data![index].name,
                            point: pointpackageresponses.data![index].point,
                            pointDetail: "RM " +
                                pointpackageresponses.data![index].myr
                                    .toString(),
                          ),
                        ],
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
