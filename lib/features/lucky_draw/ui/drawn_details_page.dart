import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/config/helper/auth_helper/auth_helper.dart';
import 'package:ninecoin/features/lucky_draw/components/my_timer.dart';
import 'package:ninecoin/features/lucky_draw/services/lucky_draw.dart';
import 'package:ninecoin/model/luckyDraw/lucky_draw_response.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/widgets/lucky_draw_information_page.dart';

import '../../../config/helper/common/get_user_info.dart';

class DrawnDetailsPage extends StatefulWidget {
  final String Luckydrawid;
  final String LuckrdrawListid;

  DrawnDetailsPage(this.Luckydrawid, this.LuckrdrawListid);

  @override
  State<DrawnDetailsPage> createState() => _DrawnDetailsPageState();
}

class _DrawnDetailsPageState extends State<DrawnDetailsPage> {
  Luckydraw getdata = Luckydraw();
  late LuckyDrawResponse luckyDrawResponse;
  late LuckyDrawListResponse luckyDrawListResponse;
  late String LuckyDrawname = "";
  late String email = "";
  late String NumberOfDraw = "";
  late String point = "";
  late String ParticipantID = "";
  late String PoolPeriod = "";
  late String DrawTime = "";
  late String reward = "";
  late int winningstatus = 0;
  late int drawnstatus = 0;
  late int drawn = 0;
  late String luckydrawredeemstatus = "";
  late String drawnstatustext = "";
  //late String drawnstatus = "";

  @override
  void initState() {
    super.initState();
    print("init");
    getLuckyDrawInfo(widget.Luckydrawid).then((value) {
      luckyDrawResponse = value;
      LuckyDrawname = luckyDrawResponse.data[0].name;

      point = luckyDrawResponse.data[0].pointsNeeded.toString();
      //LuckyDrawname = luckyDrawResponse.data[0].name;
      reward = luckyDrawResponse.data[0].prize;
      drawn = luckyDrawResponse.data[0].drawnstatus;

      print(drawn);
      getLuckyDrawListInfo(widget.LuckrdrawListid).then((value) {
        luckyDrawListResponse = value;

        ParticipantID = luckyDrawListResponse.data[0].id.toString();
        winningstatus = luckyDrawListResponse.data[0].winningstatus;
        drawnstatus = luckyDrawListResponse.data[0].drawnstatus;

        // winningstatus = luckyDrawListResponse.data[0].winningstatus;
        if (drawnstatus == 0) {
          drawnstatustext = "No yet Annouce";
        } else {
          if (winningstatus == 0) {
            drawnstatustext = "Try Again Next Time";
          } else {
            drawnstatustext = "Congulations";
          }
        }
      }).then((value) {
        setState(() {});
      });
    });
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getdata.getLuckydrawInfo(widget.Luckydrawid),
      builder: (context, snapshotx) {
        if (snapshotx.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(LuckyDrawname),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context, LuckDrawInformationPage.route());
                      },
                      child: Image.asset(Assets.information,
                          height: 20, width: 20)),
                ),
              ],
            ),
            body: FutureBuilder(
                future: getLocalUser(),
                builder: (context, AsyncSnapshot<Map?> snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("User Info",
                                        style: CoinTextStyle.orangeTitle3),
                                    const SizedBox(height: 4.0),
                                    MyDataRow(
                                        title: "User ID",
                                        value: "${snapshot.data!['id']}"),
                                    MyDataRow(
                                        title: "User Name",
                                        value: "${snapshot.data!['name']}"),
                                    MyDataRow(
                                        title: "Email",
                                        value: "${snapshot.data!['email']}"),
                                    const SizedBox(height: 6.0),
                                    const Divider(),
                                    const SizedBox(height: 12.0),
                                    Text("Draws",
                                        style: CoinTextStyle.orangeTitle3),
                                    const MyDataRow(
                                        title: "Number of Draws", value: "1"),
                                    MyDataRow(title: "Points", value: point),
                                    const SizedBox(height: 6.0),
                                    const Divider(),
                                    const SizedBox(height: 12.0),
                                    Text("Pool Info",
                                        style: CoinTextStyle.orangeTitle3),
                                    MyDataRow(
                                        title: "Pool Name",
                                        value: LuckyDrawname),
                                    MyDataRow(
                                        title: "Participate ID",
                                        value: ParticipantID),
                                    MyDataRow(
                                        title: "Total Point", value: point),
                                    MyDataRow(
                                        title: "Pool Period",
                                        value:
                                            "${snapshotx.data![0]['SEdate']}"),
                                    const MyDataRow(
                                        title: "Draw Time", value: "1/6/2022"),
                                    MyDataRow(title: "Rewards", value: reward),
                                    const SizedBox(height: 6.0),
                                    const Divider(),
                                    const SizedBox(height: 24.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Winning Result",
                                            style: CoinTextStyle.orangeTitle3),
                                      ],
                                    ),
                                    const SizedBox(height: 24.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(drawnstatustext,
                                                style: CoinTextStyle.title3
                                                    .copyWith(
                                                        color: CoinColors
                                                            .black54)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24.0),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                drawnstatus == 0
                                    ? ElevatedButton(
                                        onPressed: () async {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  alignment: Alignment.center,
                                                  backgroundColor:
                                                      CoinColors.transparent,
                                                  child: MyHomePage(
                                                      widget.LuckrdrawListid,
                                                      widget.Luckydrawid,
                                                      widget.LuckrdrawListid),
                                                );
                                              });
                                        },
                                        child: const Text("Draw"))
                                    : Text(""),
                                const SizedBox(height: 6.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("9Coin ",
                                        style: CoinTextStyle.title4Bold
                                            .copyWith(
                                                color: CoinColors.black54)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ));
                  }
                }),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class MyDataRow extends StatelessWidget {
  final String title;
  final String value;

  const MyDataRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
              width: 140,
              child: Text(title,
                  style: CoinTextStyle.title3
                      .copyWith(color: CoinColors.black54))),
          Text(value, style: CoinTextStyle.title3),
        ],
      ),
    );
  }
}
