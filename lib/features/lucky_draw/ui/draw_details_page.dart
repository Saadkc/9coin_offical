import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/main.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/draw_point_dialog.dart';
import 'package:ninecoin/utilities/dialogs/drawn_successful_dialog.dart';
import 'package:ninecoin/widgets/lucky_draw_information_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/luckyDraw/lucky_draw_response.dart';
import '../services/lucky_draw.dart';
import 'luckydraw_page.dart';

class DrawDetailsPage extends StatefulWidget {
  static route({required LuckyDrawResponse luckyDraw, required int index}) {
    return MaterialPageRoute(builder: (context) {
      return DrawDetailsPage(
        luckyDrawData: luckyDraw,
        index: index,
      );
    });
  }

  final LuckyDrawResponse luckyDrawData;
  final int index;

  const DrawDetailsPage(
      {Key? key, required this.luckyDrawData, required this.index})
      : super(key: key);

  @override
  State<DrawDetailsPage> createState() => _DrawDetailsPageState();
}

class _DrawDetailsPageState extends State<DrawDetailsPage> {
  int? selectedNoOfPoints;
  double totalAmount = 0;
  int amountofpurchase = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.luckyDrawData.data[widget.index].name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, LuckDrawInformationPage.route());
                },
                child: Image.asset(Assets.information, height: 20, width: 20)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(widget.luckyDrawData.data[widget.index]
                        .prizeImage), //luckyDrawData.data[index].prizeImage
                    const SizedBox(height: 8.0),
                    Text(widget.luckyDrawData.data[widget.index].name,
                        style: CoinTextStyle.orangeTitle2),
                    const SizedBox(height: 4.0),
                    Text(widget.luckyDrawData.data[widget.index].description,
                        style: CoinTextStyle.title3),
                    const SizedBox(height: 6.0),
                    const Divider(),
                    const SizedBox(height: 6.0),
                    Text("Rewards", style: CoinTextStyle.orangeTitle3),
                    const SizedBox(height: 4.0),
                    Text(widget.luckyDrawData.data[widget.index].prize,
                        style: CoinTextStyle.title3),
                    const SizedBox(height: 6.0),
                    const Divider(),
                    const SizedBox(height: 6.0),
                    Text("Participants", style: CoinTextStyle.orangeTitle3),
                    const SizedBox(height: 6.0),
                    Row(
                      children: [
                        Text("Number of Participants",
                            style: CoinTextStyle.title3
                                .copyWith(color: CoinColors.black54)),
                        const SizedBox(width: 24.0),
                        Text(
                            widget.luckyDrawData.data[widget.index].totalcount
                                .toString(),
                            style: CoinTextStyle.orangeTitle3),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("**One additional prize for every 100 people**",
                            style: CoinTextStyle.orangeTitle3),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(),
                    const SizedBox(height: 10.0),
                    Text("Pool Period", style: CoinTextStyle.orangeTitle3),
                    const SizedBox(height: 2.0),
                    Text(widget.luckyDrawData.data[widget.index].SEdate,
                        style: CoinTextStyle.title3),
                    const SizedBox(height: 10.0),
                    const Divider(),
                    const SizedBox(height: 10.0),
                    Text("Term and Condition",
                        style: CoinTextStyle.orangeTitle3),
                    const SizedBox(height: 6.0),
                    const Text(
                      '''1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\n2. Proin et orci in quam porta condimentum. Mauris non ligula tempus, lacinia velit a, aliquam metus. \n\n3. Nulla atone sapien scelerisque, imperdiet exq non, venenatis mi.
                    ''',
                    ),
                    const Divider(),
                    const SizedBox(height: 10.0),
                    Text("Draw in Imperdiet Ex Non",
                        style: CoinTextStyle.orangeTitle3),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Each Point Price",
                              style: CoinTextStyle.title3
                                  .copyWith(color: CoinColors.black54)),
                          Text(
                              "${widget.luckyDrawData.data[widget.index].pointsNeeded} Point",
                              style: CoinTextStyle.title3),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "No. Of Points(0/${widget.luckyDrawData.data[widget.index].maximum})",
                              style: CoinTextStyle.title3
                                  .copyWith(color: CoinColors.black54)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            height: 26,
                            decoration: BoxDecoration(
                                color: CoinColors.white,
                                borderRadius: BorderRadius.circular(4.0)),
                            child: DropdownButton(
                              iconEnabledColor: CoinColors.black54,
                              style: CoinTextStyle.title3
                                  .copyWith(color: CoinColors.black12),
                              underline: const SizedBox.shrink(),
                              dropdownColor: CoinColors.white,
                              value: selectedNoOfPoints,
                              items: List.generate(
                                  widget.luckyDrawData.data[widget.index]
                                      .maximum, (int index) {
                                return DropdownMenuItem<int>(
                                  value: index + 1,
                                  child: Text("${index + 1}"),
                                );
                              }),
                              onChanged: (int? val) {
                                setState(() {
                                  selectedNoOfPoints = val!;
                                  totalAmount = widget.luckyDrawData
                                          .data[widget.index].pointsNeeded *
                                      val.toDouble();

                                  amountofpurchase = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Amount",
                              style: CoinTextStyle.title3
                                  .copyWith(color: CoinColors.black54)),
                          Text("$totalAmount",
                              style: CoinTextStyle.title3,
                              textAlign: TextAlign.start),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("User Redeem Amount",
                              style: CoinTextStyle.title3
                                  .copyWith(color: CoinColors.black54)),
                          Text(
                              widget.luckyDrawData.data[widget.index].count
                                  .toString(),
                              style: CoinTextStyle.title3,
                              textAlign: TextAlign.start),
                        ],
                      ),
                    ),

                    const SizedBox(height: 6.0),
                    const Divider(),
                    const SizedBox(height: 6.0),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (await showDrawPointDialog(context)) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    buyluckydraw(
                            prefs.getInt('userId').toString(),
                            widget.luckyDrawData.data[widget.index].id
                                .toString(),
                            amountofpurchase)
                        .then((value) async {
                      await showDrawnSuccessfulDialog(context, value)
                          .then((value) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => App(
                                  page: 3,
                                )));
                      });
                    });

                    /* putLuckyDraw(
                            widget.luckyDrawData.data[widget.index].id
                                .toString(),
                            prefs.getInt('userId').toString())
                        .then((value) {
                      print(value);
                      Navigator.pop(context);
                    }).catchError((err) {});*/
                  }
                },
                child: const Text("Buy"))
          ],
        ),
      ),
    );
  }
}
