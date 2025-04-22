import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';

class GameOverView extends StatelessWidget {
  const GameOverView({super.key});

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
            Text('퍼즐 클리어!', style: AppTextStyle.title1),
            const SizedBox(height: 12),
            Text(
              '기록은 결과에 따라\n자동으로 랭킹에 갱신됩니다.',
              style: AppTextStyle.title1.copyWith(color: AppColor.grey80),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
