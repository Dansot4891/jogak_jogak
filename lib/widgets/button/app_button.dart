import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/app_color.dart';

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
    this.borderRadius = 20,
    this.verticalPadding = 16,
    this.horizontalPadding = 0,
    this.horizontalMargin = 16,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: _isOnTapNull ? Colors.grey : bgColor ?? AppColor.mainColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        child: Center(child: Text(text)),
      ),
    );
  }

  bool get _isOnTapNull => onTap == null;
}
