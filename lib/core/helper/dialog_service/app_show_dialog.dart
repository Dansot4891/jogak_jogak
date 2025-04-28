import 'package:flutter/material.dart';

class AppShowDialog {
  static void show(
    BuildContext context,
    Dialog dialog, {
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return dialog;
      },
    );
  }
}
