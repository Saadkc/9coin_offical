import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

import 'generic_dialog.dart';

Future<bool> showSuccessfulLoginAccountDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.updated,
    title: "Login Successful!",
    content: "",
    optionsBuilder: () => {
      "Continue": true,
    },
  ).then(
    (value) => value ?? false,
  );
}
