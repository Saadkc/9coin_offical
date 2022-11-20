import 'package:flutter/material.dart';

import '../../assets/assets.dart';
import 'generic_dialog.dart';

Future<bool> showErrorDialog(
    BuildContext context, String failTitle, String content) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.updatedDetails,
    title: "$failTitle",
    content: "$content",
    optionsBuilder: () => {
      "Back": false,
    },
  ).then(
    (value) => value ?? false,
  );
}
