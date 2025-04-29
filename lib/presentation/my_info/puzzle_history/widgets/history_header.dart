import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 80,
          alignment: Alignment.center,
          child: Text(
            LocaleKeys.historyLevel.tr(),
            style: AppTextStyle.title2.copyWith(color: AppColor.main),
          ),
        ),
        Container(
          width: 110,
          alignment: Alignment.center,
          child: Center(
            child: Text(
              LocaleKeys.historyPlayTime.tr(),
              style: AppTextStyle.title2.copyWith(color: AppColor.main),
            ),
          ),
        ),
      ],
    );
  }
}
