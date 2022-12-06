import 'package:badges/badges.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/category/ui/categories_page.dart';
import 'package:ninecoin/features/coupon/ui/coupon_page.dart';
import 'package:ninecoin/features/home/api/category.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/features/notification/ui/notifications_page.dart';
import 'package:ninecoin/model/news/news_model.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../model/notification/notification_model.dart';
import '../../category/api/merchant.dart';
import '../../category/ui/category_details_page.dart';
import '../../category/ui/category_search_result.dart';
import '../../category/ui/product_details_page.dart';
import '../../lucky_draw/ui/luckydraw_page.dart';
import '../../news/services/news.dart';
import '../../news/ui/news_details_page.dart';
import '../../news/ui/news_page.dart';
import '../../notification/services/notification_services.dart';
import '../../point/ui/point_page.dart';
import '../../profile/ui/profile_page.dart';
import '../components/category_circular_card.dart';
import '../components/circle_icon.dart';
import '../components/rounded_feature_card.dart';
import '../components/rounded_news_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  final Widget? body;
  final int? page;
  const HomePage({Key? key, this.body, this.page}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String deviceTokenToSendPushNotification = "";

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
  }

  int currentPage = 0;
  NotificationModel? notification;
  List<Widget> pages = [
    HomeScreen(),
    CouponPage(),
    PointPage(),
    LuckydrawPage(),
    NewsPage(),
  ];

// bool _enablePullDown = true;
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((message) {
      print('Firebase');
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data11 ${message.data}");
      }
    });
    // TODO: implement initState

    if (widget.page == null) {
      setState(() {
        currentPage = 0;
      });
    } else {
      setState(() {
        currentPage = widget.page!;
      });
    }
    super.initState();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    // setState(() {
    //       // HomeScreen();

    // });q
//
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) =>
              HomePage()), // this mainpage is your page to refresh
      (Route<dynamic> route) => false,
    );
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    getDeviceTokenToSendNotification();
    return FutureBuilder<NotificationModel>(
        future: getNotification(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: CoinColors.white,
                ),
              ),
            );
          }
          notification = snapshot.data;
          return Scaffold(
            key: _scaffoldKey,
            bottomNavigationBar: MyBottomNavigationBar(
              onSelectTab: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              currentTab: currentPage,
            ),
            appBar: AppBar(
              leadingWidth: 100,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16,top: 14,bottom: 1),
                child: Image.asset(Assets.appLogo),
              ),
              actions: [
                CircleIcon(
                  onTap: () {
                    Navigator.push(
                        context, NotificationPage.route(notification!));
                  },
                  icon: Badge(
                    padding: const EdgeInsets.all(4),
                    position: BadgePosition.topEnd(top: -2, end: -8),
                    badgeContent: Text(notification!.data.length.toString(),
                        style: CoinTextStyle.title5),
                    child: const Icon(Icons.notifications,
                        color: CoinColors.orange, size: 20),
                  ),
                ),
                const SizedBox(width: 12.0),
                CircleIcon(
                  onTap: () {
                    Navigator.push(context, ProfilePage.route());
                  },
                  icon: Image.asset(
                    Assets.profileIcon,
                    height: 20.5,
                    width: 20.5,
                    color: CoinColors.orange,
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),
            backgroundColor: CoinColors.black12,
            body: SmartRefresher(
                enablePullDown: true,
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                enablePullUp: true,
                footer: CustomFooter(
                  builder: (context, mode) {
                    return HomeScreen();
                  },
                ),
                child: pages[currentPage]),
          );
        });
  }
}

class HomeScreen extends StatelessWidget {
  Merchant getdata = Merchant();
  Category getcategorydata = Category();
  HomeScreen({Key? key}) : super(key: key);
  late GetNews news;
  Widget newspage = NewsPage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      // print(value);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoryResultPage(value)));
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 0, 0, 0),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                  child: CarouselSlider(
                options: CarouselOptions(),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return FutureBuilder<List>(
                        future: getcategorydata.banner(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.network(
                                  snapshot.data![0]
                                          ['bannerimage_' + i.toString()]
                                      .toString(),
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }, errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                return Image.asset("assets/pics/slider.jpg");
                              }),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      );
                    },
                  );
                }).toList(),
              )),
            ],
          ),
          //const SizedBox(height: 0),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CategoryListPage.rout());
                        // Navigator.push(context, CategoryListPage.rout());
                      },
                      child: Text("View all",
                          style: CoinTextStyle.title3
                              .copyWith(color: CoinColors.orange)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List>(
                  future: getcategorydata.getcategoryrandom(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        children: <Widget>[
                          for (int i = 0; i < snapshot.data!.length; i++)
                            CategoryCircularCard(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CategoryDetailsPage(
                                          snapshot.data![i]['name']
                                              .toString())));
                                },
                                imageurl: snapshot.data![i]['imageurl'],
                                imageUrl: Assets.salon,
                                color: CoinColors.transparent,
                                label: snapshot.data![i]['name'].toString()),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Features", style: CoinTextStyle.title1),
                    InkWell(
                      onTap: () {},
                      child: Text("",
                          style: CoinTextStyle.title3
                              .copyWith(color: CoinColors.orange)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List>(
                    future: getdata.Featuremerchant(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                          children: <Widget>[
                            for (int i = 0; i < snapshot.data!.length; i++)
                              RoundedFeatureCard(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductDetailsPage(
                                          snapshot.data![i]['id'],
                                          snapshot.data![i]['name'],
                                          snapshot.data![i]['image'],
                                          snapshot.data![i]
                                              ['totalproductimage'],
                                          snapshot.data![i]['randomnumber'])));
                                },
                                imageUrl: snapshot.data![i]['image'],
                                title: snapshot.data![i]['name'],
                                pNumber: snapshot.data![i]['phone'],
                                location: snapshot.data![i]['address'],
                              )
                          ],
                        );
                      } else
                        return CircularProgressIndicator();
                    }),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("News", style: CoinTextStyle.title1),
                    InkWell(
                      onTap: () {
                        //print("test");
                      },
                      child: Text("",
                          style: CoinTextStyle.title3
                              .copyWith(color: CoinColors.orange)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<GetNews>(
                    future: FeatureNews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        news = snapshot.data!;
                        return Row(
                          children: <Widget>[
                            for (int i = 0; i < news.data.length; i++)
                              RoundedNewsCard(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      NewsDetailsPage.route(
                                          news: news, index: i));
                                },
                                imageUrl: news.data[i].photo,
                                date: news.data[i].date,
                                title: news.data[i].name,
                                desc: "",
                              )
                          ],
                        );
                      } else
                        return Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
