import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';

class SettingCard extends StatelessWidget {
  final String text;
  final Color? baseColor;
  final VoidCallback onTap;
  const SettingCard({
    required this.text,
    required this.onTap,
    this.baseColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppTextStyle.body2.copyWith(color: baseColor)),
            Icon(Icons.arrow_forward_ios, color: baseColor ?? AppColor.greyA7),
          ],
        ),
      ),
    );
  }
}
