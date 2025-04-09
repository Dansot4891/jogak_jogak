import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/presentation/rank/widgets/ranking_graph.dart';
import 'package:jogak_jogak/presentation/rank/widgets/ranking_row.dart';

class RankingTabview extends StatelessWidget {
  const RankingTabview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RankingGraph(index: 1, name: 'name', time: '1:02'),
              RankingGraph(index: 2, name: 'name', time: '1:02'),
              RankingGraph(index: 3, name: 'name', time: '1:02'),
            ],
          ),
          const SizedBox(height: 4),
          RankingRow(index: '등수', name: '이름', time: '시간'),
          Expanded(
            child: ListView.separated(
              itemCount: 10 + 1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RankingRow(
                  index: '${index + 1}',
                  name: 'name',
                  time: '2:01',
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: AppColor.sub);
              },
            ),
          ),
        ],
      ),
    );
  }
}
