import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';

// 주의 문구
class AlertMessage extends StatelessWidget {
  const AlertMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: '!! ',
          style: AppTextStyle.subText2.copyWith(color: AppColor.red),
          children: [
            TextSpan(
              text: LocaleKeys.homeTodayPuzzleGuide.tr(),
              style: AppTextStyle.subText2,
            ),
            const TextSpan(text: ' !!'),
          ],
        ),
      ),
    );
  }
}
