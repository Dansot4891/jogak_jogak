import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';

class AppButton extends StatefulWidget {
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
  final bool isExpanded;

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
    this.isExpanded = false,
    required this.onTap,
    super.key,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  // 누름시 버튼 색상을 변경하기 위한 변수값
  bool disable = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isExpanded) {
      return Expanded(child: appButton());
    }
    return appButton();
  }

  InkWell appButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      onTap: widget.onTap,
      onTapDown: (details) {
        setState(() {
          disable = true;
        });
      },
      onTapCancel: () {
        setState(() {
          disable = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          disable = false;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        padding: EdgeInsets.symmetric(
          vertical: widget.verticalPadding,
          horizontal: widget.horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: _isOnTapNull ? Colors.grey : widget.bgColor ?? AppColor.main,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: widget.border,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: AppTextStyle.button.copyWith(color: widget.textColor),
          ),
        ),
      ),
    );
  }

  bool get _isOnTapNull => widget.onTap == null || disable;
}
