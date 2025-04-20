import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';

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
          Container(
            margin: const EdgeInsets.only(top: 8),
            alignment: Alignment.center,
            width: AppSize.ratioWidth(70),
            child: Text(
              name,
              style: AppTextStyle.rank,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(time, style: AppTextStyle.rank),
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
          ),
        ],
      ),
    );
  }
}
