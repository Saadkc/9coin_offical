import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

import 'generic_dialog.dart';

Future<bool> showNewPasswordResetDialog(BuildContext context, String text) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.updated,
    title: "Code has been sent to reset a new password!",
    content: text,
    optionsBuilder: () => {
      "Done": true,
    },
  ).then(
    (value) => value ?? false,
  );
}
