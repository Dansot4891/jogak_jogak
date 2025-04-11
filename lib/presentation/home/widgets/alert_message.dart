import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: '!!',
          style: AppTextStyle.subText2.copyWith(color: AppColor.red),
          children: [
            TextSpan(
              text: ' 오늘의 퍼즐은 매 게임마다 변경됩니다 ',
              style: AppTextStyle.subText2,
            ),
            const TextSpan(text: '!!'),
          ],
        ),
      ),
    );
  }
}
