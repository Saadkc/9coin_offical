import 'package:flutter/material.dart';
import 'package:ninecoin/extensions/buildcontext/loc.dart';

import 'generic_dialog.dart';

Future<bool> showConfermDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: "",
    title: context.loc.delete,
    content: context.loc.delete_note_prompt,
    optionsBuilder: () => {
      context.loc.cancel: false,
      context.loc.yes: true,
    },
  ).then(
    (value) => value ?? false,
  );
}
