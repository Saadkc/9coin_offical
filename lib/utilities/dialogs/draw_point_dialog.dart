import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

import 'generic_dialog.dart';

Future<bool> showDrawPointDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.redeem,
    title: "Draw Point?",
    content: "The Point was unrefundale!",
    optionsBuilder: () => {
      "Back": false,
      "Redeem": true,
    },
  ).then(
    (value) => value ?? false,
  );
}
