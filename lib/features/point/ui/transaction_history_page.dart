import 'package:flutter/material.dart';
import 'package:ninecoin/features/point/components/transaction_tile.dart';
import 'package:ninecoin/features/point/ui/transaction_details_page.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: ListView(
        children: [
          TransactionTile(
            onTap: () {
              Navigator.push(context, TranctionDetailsPage.route());
            },
            date: "28/4/2022",
            packageNum: "Package 2",
            point: 20,
            pointDetail: "RM 65",
          ),
          const TransactionTile(
            date: "26/4/2022",
            packageNum: "Package 1",
            point: 10,
            pointDetail: "RM 35",
          ),
          const TransactionTile(
            date: "21/4/2022",
            packageNum: "Package 4",
            point: 50,
            pointDetail: "RM 150",
            isShowDivider: false,
          ),
        ],
      ),
    );
  }
}
