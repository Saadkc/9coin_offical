import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/category/api/merchant.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';

import '../../../config/config.dart';

class ProductDetailsPage extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final int totalpicture;
  final int randomnumber;
  const ProductDetailsPage(
      this.id, this.name, this.image, this.totalpicture, this.randomnumber,
      {super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  late int merchantid;
  @override
  void initState() {
    merchantid = widget.id;

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(145),
            child: AppBar(
              centerTitle: true,
              title: Text(widget.name),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.image),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Container(
                      color: CoinColors.fullBlack.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: CoinColors.dialogTextColor,
                unselectedLabelColor: CoinColors.black54,
                labelStyle: CoinTextStyle.title2,
                indicatorPadding: const EdgeInsets.all(16),
                labelPadding: const EdgeInsets.all(12),
                tabs: const [
                  Tab(text: "Details"),
                  Tab(text: "Products"),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ProductDetails(widget.id),
                    Products(
                        widget.totalpicture, widget.id, widget.randomnumber),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}

class ProductDetails extends StatelessWidget {
  late int id;
  ProductDetails(this.id);

  Merchant getdata = Merchant();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getdata.getString(id.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  Text(
                    snapshot.data![index]['name'],
                    style: CoinTextStyle.title2Bold
                        .copyWith(color: CoinColors.orange),
                  ),
                  Text(
                    snapshot.data![index]['email'],
                    style: CoinTextStyle.title4,
                  ),
                  Text(
                    snapshot.data![index]['phone'],
                    style: CoinTextStyle.title4,
                  ),
                  Text(
                    snapshot.data![index]['address'],
                    style: CoinTextStyle.title4,
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 2),
                  const SizedBox(height: 12),
                  Text(
                    "Description",
                    style: CoinTextStyle.title3Bold
                        .copyWith(color: CoinColors.orange),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    snapshot.data![index]['description'],
                    textAlign: TextAlign.left,
                    style: CoinTextStyle.title3,
                  ),
                  const SizedBox(height: 12),
                  const Divider(thickness: 2),
                  const SizedBox(height: 12),
                  Text(
                    "Our Services",
                    style: CoinTextStyle.title3Bold
                        .copyWith(color: CoinColors.orange),
                  ),
                  Column(
                    children: <Widget>[
                      for (int i = 0;
                          i < snapshot.data![index]['servicecount'];
                          i++)
                        Column(
                          children: [
                            const SizedBox(height: 6),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  snapshot.data![index]
                                      ['service_' + i.toString()],
                                  style: CoinTextStyle.title4.copyWith(
                                    letterSpacing: 0.5,
                                  )),
                            ),
                            const SizedBox(height: 6),
                          ],
                        )
                    ],
                  ),
                ]);
              });
        } else {
          return const Center(child: Text("No Data"));
        }
      },
    );
  }
}

class Products extends StatelessWidget {
  late int totalproductimage;
  late int id;
  late int randomnumber;
  Products(this.totalproductimage, this.id, this.randomnumber);
  String url = Api.bucketurl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: GridView.builder(
        itemCount: totalproductimage,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 0.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
              imageURL: url +
                  id.toString() +
                  "/" +
                  id.toString() +
                  (index + 1).toString() +
                  randomnumber.toString() +
                  ".jpg");
        },
      ),
    );
  }
}

List<Widget> productcard = [
  ProductCard(imageURL: Assets.earphone),
  ProductCard(imageURL: Assets.earphone2),
  ProductCard(imageURL: Assets.earphone3),
  ProductCard(imageURL: Assets.earphone4),
];

class ProductCard extends StatelessWidget {
  final String imageURL;
  ProductCard({Key? key, required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageURL),
        ),
      ),
    );
  }
}
