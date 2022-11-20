import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

import 'generic_dialog.dart';

Future<bool> showSuccessfulCouponDialog(
    BuildContext context, String purchasecondition) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.updated,
    title: "Purchase Successful!",
    content: purchasecondition,
    optionsBuilder: () => {
      "Back": false,
    },
  ).then(
    (value) => value ?? false,
  );
}
