import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/text_style.dart';

class AppButton extends StatelessWidget {
  // Todo
  // TextStyle 설정
  // --- text style ---
  final Color? textColor;
  final FontWeight fontWeight;
  final double fontSize;
  // --- --- --- --- ---
  final String text;
  final Color? bgColor;
  final Border? border;
  final VoidCallback? onTap;
  final double horizontalMargin;
  final double borderRadius;
  final double verticalPadding;
  final double horizontalPadding;

  const AppButton({
    required this.text,
    // --- text style ---
    this.textColor,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 20,
    // --- --- --- --- ---
    this.bgColor,
    this.border,
    this.borderRadius = 16,
    this.verticalPadding = 12,
    this.horizontalPadding = 0,
    this.horizontalMargin = 0,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      onTap: onTap,
      splashColor: Colors.white,
      highlightColor: Colors.black,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: _isOnTapNull ? Colors.grey : bgColor ?? AppColor.main,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.button,
          ),
        ),
      ),
    );
  }

  bool get _isOnTapNull => onTap == null;
}
