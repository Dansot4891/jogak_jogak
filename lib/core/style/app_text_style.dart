import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogak_jogak/core/style/app_color.dart';

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

  // title
  static TextStyle title1 = boldStyle(24, null);
  static TextStyle title2 = boldStyle(20, null);

  // tabbar
  static TextStyle tabbar = mediumStyle(16, null);

  // textfield
  static TextStyle textField = mediumStyle(14, null);

  // sub
  static TextStyle subText1 = mediumStyle(
    20,
    null,
  ).copyWith(color: AppColor.grey80);
  static TextStyle subText2 = mediumStyle(
    20,
    null,
  ).copyWith(color: AppColor.greyA7);

  // body
  static TextStyle body1 = mediumStyle(14, null);
  static TextStyle body2 = mediumStyle(18, null);

  // button
  static TextStyle button = mediumStyle(
    18,
    null,
  ).copyWith(color: AppColor.white);

  // rank
  static TextStyle rank = mediumStyle(16, null);

  // version
  static TextStyle version = mediumStyle(
    12,
    null,
  ).copyWith(color: AppColor.greyA7);
}
