import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/category/components/cirlce_category_icon.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';
import '../../home/api/category.dart';
import 'category_details_page.dart';

class CategoryListPage extends StatefulWidget {
  static Route rout() {
    return MaterialPageRoute(builder: (context) => const CategoryListPage());
  }

  const CategoryListPage({Key? key}) : super(key: key);

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  @override
  Category getdata = new Category();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(145),
          child: AppBar(
            centerTitle: true,
            title: Text(
              "Categories",
              style: CoinTextStyle.title2Bold,
            ),
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Assets.categories),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: CoinColors.fullBlack.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: FutureBuilder<List>(
            future: getdata.getcategory(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return GridView(
                  padding: const EdgeInsets.only(top: 26),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.9,
                  ),
                  children: <Widget>[
                    for (int i = 0; i < snapshot.data!.length; i++)
                      CirlceCategoryIcon(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CategoryDetailsPage(
                                  snapshot.data![i]['name'])));
                        },
                        imageurl: snapshot.data![i]['imageurl'],
                        imageUrl: Assets.salon,
                        color: CoinColors.transparent,
                        label: snapshot.data![i]['name'],
                      ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })),
      ),
    );
  }
}
