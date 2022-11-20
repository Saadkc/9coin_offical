import 'package:flutter/material.dart';
import 'package:ninecoin/features/coupon/ui/coupon_page.dart';
import 'package:ninecoin/features/home/ui/home_page.dart';
import 'package:ninecoin/features/lucky_draw/ui/luckydraw_page.dart';
import 'package:ninecoin/features/news/ui/news_page.dart';
import 'package:ninecoin/features/point/ui/point_page.dart';

enum TabItem { home, coupon, point, luckDraw, news }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.coupon: 'coupon',
  TabItem.point: 'point',
  TabItem.luckDraw: 'luckDraw',
  TabItem.news: 'news',
};

Map<TabItem, Widget> activePage = {
  TabItem.home: HomeScreen(),
  TabItem.coupon: const CouponPage(),
  TabItem.point: const PointPage(),
  TabItem.luckDraw: const LuckydrawPage(),
  TabItem.news: NewsPage(),
};
