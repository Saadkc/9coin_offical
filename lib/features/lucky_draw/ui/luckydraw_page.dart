import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

import '../components/draw_item_list.dart';
import '../components/lucky_draw_win.dart';
import '../components/lucky_drawn_Items.dart';

class LuckydrawPage extends StatefulWidget {
  const LuckydrawPage({Key? key}) : super(key: key);

  @override
  State<LuckydrawPage> createState() => _LuckydrawPageState();
}

class _LuckydrawPageState extends State<LuckydrawPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: CoinColors.mediumBlack,
          child: TabBar(
            unselectedLabelColor: CoinColors.black54,
            labelColor: CoinColors.orange,
            labelStyle: CoinTextStyle.orangeTitle3,
            tabs: const [
              Tab(text: 'Draw'),
              Tab(text: 'Drawn'),
              Tab(text: 'Win'),
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: CoinColors.orange,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              DrawItemsList(),
              LuckyDrwanItems(),
              LuckyDrawWin(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
