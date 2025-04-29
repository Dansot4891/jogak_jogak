import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';

class RankingRow extends StatelessWidget {
  final String index;
  final String name;
  final String time;
  const RankingRow({
    required this.index,
    required this.name,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Center(child: Text(index, style: AppTextStyle.rank)),
          ),
          const SizedBox(width: 32),
          Expanded(child: Text(name, style: AppTextStyle.rank)),
          const SizedBox(width: 16),
          SizedBox(
            width: 100,
            child: Center(child: Text(time, style: AppTextStyle.rank)),
          ),
        ],
      ),
    );
  }
}
