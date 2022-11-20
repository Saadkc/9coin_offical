import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/features/point/api/productredemption.dart';
import 'package:ninecoin/features/point/ui/redeem_card_details_page.dart';

import 'redeemptions_card.dart';

class RedeemListTile extends StatefulWidget {
  const RedeemListTile({
    Key? key,
  }) : super(key: key);

  @override
  State<RedeemListTile> createState() => _RedeemListTileState();
}

class _RedeemListTileState extends State<RedeemListTile> {
  ProductRedeem getdata = new ProductRedeem();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getdata.getproductlist(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return RedeemptionsCard(
                point: snapshot.data![index]['point'],
                address: snapshot.data![index]['address'],
                name: snapshot.data![index]['name'],
                imageUrl: snapshot.data![index]['image_url'],
                title: snapshot.data![index]['title'],
                redeemstatus: " ",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RedeemCardDetailsPage(
                            snapshot.data![index]['id'],
                          )));
                },
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
