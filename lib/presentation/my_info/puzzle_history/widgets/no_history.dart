import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';

class NoHistory extends StatelessWidget {
  const NoHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(Icons.close, color: AppColor.red, size: 64),
          Text(
            '퍼즐 기록이 없습니다.',
            style: AppTextStyle.body2.copyWith(color: AppColor.grey43),
          ),
        ],
      ),
    );
  }
}
