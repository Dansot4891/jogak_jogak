import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/style/app_color.dart';

class BouncingBox extends StatelessWidget {
  final double left;
  final double top;
  final double angle;
  final double boxSize;
  const BouncingBox({
    required this.left,
    required this.top,
    required this.angle,
    required this.boxSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(color: AppColor.sub),
        ),
      ),
    );
  }
}
