import 'package:flutter/material.dart';
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
            '난이도',
            style: AppTextStyle.title2.copyWith(color: AppColor.main),
          ),
        ),
        Container(
          width: 110,
          alignment: Alignment.center,
          child: Center(
            child: Text(
              '플레이 타임',
              style: AppTextStyle.title2.copyWith(color: AppColor.main),
            ),
          ),
        ),
      ],
    );
  }
}
