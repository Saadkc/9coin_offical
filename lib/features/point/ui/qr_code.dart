import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../config/helper/common/get_user_info.dart';
import 'package:barcode_widget/barcode_widget.dart';

class PointQrCode extends StatefulWidget {
  static Route<PointQrCode> route() {
    return MaterialPageRoute(builder: (context) => const PointQrCode());
  }

  const PointQrCode({Key? key}) : super(key: key);

  @override
  State<PointQrCode> createState() => _PointQrCodeState();
}

class _PointQrCodeState extends State<PointQrCode> {
  int? userId;

  @override
  void initState() {
    getUserId().then((value) {
      setState(() {
        userId = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "QR Code",
          style: CoinTextStyle.title2Bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: userId.toString(),
              version: QrVersions.auto,
              size: 300.0,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 7),
            Text(
              userId == null ? "ID : " : "ID : $userId",
              style: CoinTextStyle.title2Bold,
            )
          ],
        ),
      ),
    );
  }
}
