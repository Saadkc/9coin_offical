import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/point/api/productredemption.dart';
import 'package:ninecoin/features/point/ui/redeemed_card_details_page.dart';

import 'redeemptions_card.dart';

class RedeemedListTile extends StatefulWidget {
  const RedeemedListTile({
    Key? key,
  }) : super(key: key);

  @override
  State<RedeemedListTile> createState() => _RedeemedListTileState();
}

class _RedeemedListTileState extends State<RedeemedListTile> {
  ProductRedeem getdata = new ProductRedeem();

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
    return FutureBuilder<List>(
      future: getdata.showpurchasedproduct(Userid),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return FutureBuilder<List>(
                future: getdata.getproductdetail(
                    snapshot.data![index]['ProductRedeemid'].toString()),
                builder: (context, indexx) {
                  if (indexx.hasData) {
                    print(snapshot.data![index]['redeemstatus']);
                    return RedeemptionsCard(
                      point: indexx.data![0]['point'],
                      address: indexx.data![0]['address'],
                      name: indexx.data![0]['name'],
                      imageUrl: indexx.data![0]['image_url'],
                      title: indexx.data![0]['title'],
                      redeemstatus: " ",
                      buttonText: snapshot.data![index]['redeemstatus'] == 0
                          ? "Use"
                          : "Used",
                      buttonColor: snapshot.data![index]['redeemstatus'] == 0
                          ? CoinColors.blue
                          : CoinColors.black12,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RedeemedCardDetailsPage(
                                  snapshot.data![index]['ProductRedeemid']
                                      .toString(),
                                  snapshot.data![index]['id'].toString(),
                                )));
                      },
                    );
                  } else {
                    return RedeemptionsCard(
                      point: '',
                      address: '',
                      name: '',
                      imageUrl: '',
                      title: '',
                      buttonText: "",
                      redeemstatus: " ",
                      buttonColor: CoinColors.blue,
                      onTap: () {},
                    );
                  }
                },
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
