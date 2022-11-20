import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/category/ui/product_details_page.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';
import '../api/merchant.dart';

class CategoryResultPage extends StatefulWidget {
  final String search;

  const CategoryResultPage(this.search);

  @override
  State<CategoryResultPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryResultPage> {
  Merchant getdata = new Merchant();
  @override
  void initState() {
    super.initState();
    //getdata.getUserId().then((value) {
    setState(() {
      //  Userid = value.toString();
      //  print(Userid);
    });
  }
  //);
  //futuredata = getString("220001");
  // futureAlbum = fetchAlbum();

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: CoinColors.black,
        appBar: AppBar(
          backgroundColor: CoinColors.black12,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Result',
            style: CoinTextStyle.title2Bold,
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  color: CoinColors.black12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [],
                    ),
                  ),
                ),
                FutureBuilder<List>(
                    future: getdata.searchresult(widget.search),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data!.length);
                        if (snapshot.data!.length <= 0) {
                          return Center(
                            child: Text("No Merchant Found"),
                          );
                        } else {
                          return Column(
                            children: <Widget>[
                              for (int i = 0; i < snapshot.data!.length; i++)
                                RoundedElectricCard(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsPage(
                                                    snapshot.data![i]['id'],
                                                    snapshot.data![i]['name'],
                                                    snapshot.data![i]['image'],
                                                    snapshot.data![i]
                                                        ['totalproductimage'],
                                                    snapshot.data![i]
                                                        ['randomnumber'])));
                                  },
                                  imageUrl: snapshot.data![i]['image'],
                                  title: snapshot.data![i]['name'],
                                  pNumber: snapshot.data![i]['phone'],
                                  location: snapshot.data![i]['address'],
                                ),
                            ],
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedElectricCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String pNumber;
  final String location;
  final Function() onTap;
  const RoundedElectricCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.pNumber,
    required this.location,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15.0),
            height: 240,
            width: 400,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: CoinColors.fullBlack,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6.0),
                            topRight: Radius.circular(6.0),
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(title,
                            style: CoinTextStyle.title3Bold.copyWith(
                                color: CoinColors.orange,
                                fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.phone, size: 16.0),
                          ),
                          Text(pNumber, style: CoinTextStyle.title4),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.location_on_rounded, size: 16.0),
                          ),
                          Flexible(
                            child: Text(location, style: CoinTextStyle.title5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
