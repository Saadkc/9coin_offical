import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/typography/text_styles.dart';

import '../services/purchase_history.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PurchaseTile extends StatefulWidget {
  final Function()? onTap;
  final String date;
  final String title;
  final String subtitle;
  final int point;
  final bool isShowDivider;
  const PurchaseTile({
    Key? key,
    this.onTap,
    required this.date,
    required this.title,
    required this.subtitle,
    required this.point,
    this.isShowDivider = true,
  }) : super(key: key);

  @override
  State<PurchaseTile> createState() => _PurchaseTileState();
}

class _PurchaseTileState extends State<PurchaseTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          onTap: widget.onTap,
          leading: Text(widget.date,
              style: CoinTextStyle.title3.copyWith(height: 1.6)),
          title: Text(widget.title, style: CoinTextStyle.title3),
          subtitle: Text(widget.subtitle, style: CoinTextStyle.title3),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${widget.point} point", style: CoinTextStyle.orangeTitle3),
              const SizedBox(width: 10),
              GestureDetector(
                  onTap: () async {
                    String uri =
                        "https://9coin.s3.ap-southeast-1.amazonaws.com/Invoices/222321.pdf";

                    downloadFile(uri, "test.pdf");
                  },
                  child: Image.asset(Assets.download, height: 15, width: 15)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        widget.isShowDivider ? const Divider() : const Opacity(opacity: 0),
      ],
    );
  }

  Future<void> downloadFile(uri, fileName) async {
    String savePath = await getFilePath(fileName);

    Dio dio = Dio();

    dio.download(uri, savePath);
  }

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getApplicationDocumentsDirectory();

    path = '${dir.path}/$uniqueFileName.pdf';

    return path;
  }
}
