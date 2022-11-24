import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

class DiscountCouponCard extends StatelessWidget {
  final String imageUrl;
  final String maxredeemper;
  final String title;
  final String originalpoint;
  final String promopoint;
  final String period;
  final Function()? onTap;
  const DiscountCouponCard(
      {Key? key,
      required this.imageUrl,
      required this.maxredeemper,
      required this.title,
      required this.originalpoint,
      required this.promopoint,
      required this.period,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Stack(children: [
        Row(
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width * 0.55,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
            ),
            Container(
              height: size.height * 0.15,
              width: size.width * 0.35,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: (BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff70bea4),
                            fontWeight: FontWeight.bold),
                      ),
                       SizedBox(
                        height: size.height * 0.01,
                      ),
                    
                     
                      Row(
                        children: [
                        const  Text(
                            'Point:',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff70bea4),
                            ),
                          ),
                          Text(
                            promopoint,
                            style:const TextStyle(
                              fontSize: 18,
                              color: Color(0xff70bea4),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Point: ' + originalpoint,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          fontSize: 11,
                          color: Color(0xff70bea4),
                        ),
                      ),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(
                            padding:  EdgeInsets.only(top: 6),
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xff70bea4),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          const Text(
                            '20%',
                            style: TextStyle(
                              fontSize: 18.1,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff70bea4),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
        Positioned(
            left: size.width * 0.525,
            child: Container(
              height: 11,
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xff2c2c2c),
                  borderRadius: (BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ))),
            )),
        Positioned(
            left: size.width * 0.525,
            top: size.height * 0.14,
            child: Container(
              height: 12,
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xff2c2c2c),
                  borderRadius: (BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ))),
            )),
        Positioned(
            bottom: 8,
            child: Container(
              height: 30,
              width: 130,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Limited ' + maxredeemper + ' Only',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    Text(
                      period,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}


// class MyClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//      var path =  new Path();
//      path.lineTo(0, size.height);
//           path.lineTo(size.width, size.height);

//      path.close();
//      return new Path();
//        }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;




// }