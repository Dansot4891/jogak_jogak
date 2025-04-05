import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  static TextStyle baseStyle(double size, double? height) => TextStyle(
    fontFamily: 'Pretendard',
    leadingDistribution: TextLeadingDistribution.even,
    fontSize: size,
    height: height == null ? null : height / size,
  );

  static TextStyle regularStyle(double size, double? height) =>
      baseStyle(size, height).copyWith(fontWeight: FontWeight.w400);

  static TextStyle mediumStyle(double size, double? height) =>
      baseStyle(size, height).copyWith(fontWeight: FontWeight.w500);

  static TextStyle boldStyle(double size, double? height) =>
      baseStyle(size, height).copyWith(fontWeight: FontWeight.w700);

  static TextStyle title1 = boldStyle(24, null);
  static TextStyle textField = regularStyle(14, null);
  static TextStyle body1 = mediumStyle(14, null);
  static TextStyle button = regularStyle(16, null);
}
