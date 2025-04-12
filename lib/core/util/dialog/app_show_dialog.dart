import 'package:flutter/material.dart';

class AppShowDialog {
  static void show(BuildContext context, Dialog dialog) {
    showDialog(
      context: context,
      builder: (context) {
        return dialog;
      },
    );
  }
}
