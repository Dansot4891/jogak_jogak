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
        return PopScope(
          // 뒤로가기를 막는 속성
          canPop: barrierDismissible,
          child: dialog,
        );
      },
    );
  }
}
