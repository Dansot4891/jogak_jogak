import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';

class RankingGraph extends StatelessWidget {
  final int index;
  final String name;
  final String time;
  const RankingGraph({
    required this.index,
    required this.name,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              name,
              style: AppTextStyle.rank,
              overflow: TextOverflow.visible,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: AppSize.ratioHeight(50) * (4 - index),
            width: AppSize.ratioWidth(50),
            decoration: BoxDecoration(
              color: AppColor.sub,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(child: Text(time, style: AppTextStyle.rank)),
          ),
        ],
      ),
    );
  }
}
