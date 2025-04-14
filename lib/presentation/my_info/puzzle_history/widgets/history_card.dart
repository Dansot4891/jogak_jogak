import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/helper/extension/date_time_extension.dart';

class HistoryCard extends StatelessWidget {
  final int level;
  final String playTime;
  final DateTime endTime;
  final bool showDivider;
  const HistoryCard({
    required this.level,
    required this.playTime,
    required this.endTime,
    required this.showDivider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: showDivider ? 0 : 12, bottom: 12),
      child: Column(
        children: [
          if (showDivider)
            Row(
              children: [
                Expanded(child: Container(color: AppColor.sub, height: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    endTime.toRelativeDate(),
                    style: AppTextStyle.body2.copyWith(color: AppColor.grey80),
                  ),
                ),
                Expanded(child: Container(color: AppColor.sub, height: 1)),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                alignment: Alignment.center,
                child: Text('$level X $level', style: AppTextStyle.body2),
              ),
              Container(
                width: 110,
                alignment: Alignment.center,
                child: Center(child: Text(playTime, style: AppTextStyle.body2)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
