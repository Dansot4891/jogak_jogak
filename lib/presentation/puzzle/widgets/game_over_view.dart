import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';

class GameOverView extends StatelessWidget {
  final bool isCertified;
  const GameOverView({super.key, required this.isCertified});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.clear,
              width: AppSize.fractionHeight(0.2),
              height: AppSize.fractionHeight(0.2),
            ),
            Text(LocaleKeys.inGameClear.tr(), style: AppTextStyle.title1),
            const SizedBox(height: 12),
            if (isCertified)
              Text(
                LocaleKeys.inGameRankingInfo.tr(),
                style: AppTextStyle.title1.copyWith(color: AppColor.grey80),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
