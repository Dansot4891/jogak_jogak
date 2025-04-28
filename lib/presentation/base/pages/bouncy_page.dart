import 'package:bouncy_background/bouncy_background.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/style/app_color.dart';

class BouncyPage extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  const BouncyPage({
    required this.child,
    this.resizeToAvoidBottomInset,
    this.appBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BouncyBackground(
      boxCount: 6,
      boxWidth: _boxSize,
      boxHeight: _boxSize,
      isScaffold: true,
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: AppColor.white,
      bouncyWidget: Container(
        width: _boxSize,
        height: _boxSize,
        decoration: BoxDecoration(color: AppColor.sub),
      ),
      body: child,
    );
  }

  static double get _boxSize => AppSize.ratioWidth(70);
}
