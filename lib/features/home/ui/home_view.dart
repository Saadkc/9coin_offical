// import 'package:flutter/material.dart';
// import 'package:ninecoin/assets/assets.dart';
// import 'package:ninecoin/colors/colors.dart';
// import 'package:ninecoin/features/home/components/tab_item.dart';
// import '../components/my_bottom_navigation_bar.dart';
// import '../components/tab_navigator.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           backgroundColor: CoinColors.transparent,
//           title: Image.asset(Assets.luckyDrawPopUp),
//           titlePadding: const EdgeInsets.all(0),
//           contentPadding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
//           content: Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: CoinColors.white, width: 1.6),
//             ),
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Icon(Icons.close, color: CoinColors.white, size: 24),
//             ),
//           ),
//           alignment: Alignment.center,
//         ),
//       );
//     });
//   }

//   final ValueNotifier<TabItem> _valueNotifier = ValueNotifier(TabItem.home);

//   final _navigatorKeys = {
//     TabItem.home: GlobalKey<NavigatorState>(),
//     TabItem.coupon: GlobalKey<NavigatorState>(),
//     TabItem.point: GlobalKey<NavigatorState>(),
//     TabItem.luckDraw: GlobalKey<NavigatorState>(),
//     TabItem.news: GlobalKey<NavigatorState>(),
//   };

//   void _selectTab(TabItem currentTab, TabItem tabItem) {
//     if (tabItem == currentTab) {
//       _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
//     } else {
//       setState(() => currentTab = tabItem);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<TabItem>(
//       valueListenable: _valueNotifier,
//       builder: (context, TabItem newValue, widgets) {
//         return Container(
//           color: CoinColors.fullBlack,
//           child: SafeArea(
//             child: WillPopScope(
//               onWillPop: () async {
//                 final isFirstRouteInCurrentTab =
//                     !await _navigatorKeys[newValue]!.currentState!.maybePop();
//                 if (isFirstRouteInCurrentTab) {
//                   if (newValue != TabItem.home) {
//                     _selectTab(newValue, TabItem.home);
//                     return false;
//                   }
//                 }
//                 return isFirstRouteInCurrentTab;
//               },
//               child: Scaffold(
//                 body: Stack(children: [
//                   _buildOffstageNavigator(newValue, TabItem.home),
//                   _buildOffstageNavigator(newValue, TabItem.coupon),
//                   _buildOffstageNavigator(newValue, TabItem.point),
//                   _buildOffstageNavigator(newValue, TabItem.luckDraw),
//                   _buildOffstageNavigator(newValue, TabItem.news),
//                 ]),
//                 bottomNavigationBar: MyBottomNavigationBar(
//                   onSelectTab: (tabItem) {
//                     if (tabItem == newValue) {
//                       _navigatorKeys[tabItem]!
//                           .currentState!
//                           .popUntil((route) => route.isFirst);
//                     } else {
//                       _valueNotifier.value = tabItem;
//                     }
//                   },
//                   currentTab: newValue,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildOffstageNavigator(TabItem currentTab, TabItem tabItem) {
//     return Offstage(
//       offstage: currentTab != tabItem,
//       child: TabNavigator(
//         navigatorKey: _navigatorKeys[tabItem],
//         tabItem: tabItem,
//       ),
//     );
//   }
// }
