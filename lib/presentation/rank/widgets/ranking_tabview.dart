import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/mock/mock_ranking_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/remote/ranking_remote_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/repository_impl/ranking_repository_impl.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/get_rankings_use_case.dart';
import 'package:jogak_jogak/presentation/rank/view_model/ranking_view_model.dart';
import 'package:jogak_jogak/presentation/rank/widgets/ranking_graph.dart';
import 'package:jogak_jogak/presentation/rank/widgets/ranking_row.dart';

final vm = RankingViewModel(
  GetRankingsUseCase(
    RankingRepositoryImpl(
      RankingRemoteDataSourceImpl(FirebaseFirestore.instance),
    ),
  ),
);

class RankingTabview extends StatelessWidget {
  const RankingTabview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) {
        if (vm.rankings.isEmpty) {
          return const CircularProgressIndicator();
        }
        final rankings = vm.rankings;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RankingGraph(
                    index: rankings[1].rank,
                    name: rankings[1].nickname,
                    time: rankings[1].playTime,
                  ),
                  RankingGraph(
                    index: rankings[0].rank,
                    name: rankings[0].nickname,
                    time: rankings[0].playTime,
                  ),
                  RankingGraph(
                    index: rankings[2].rank,
                    name: rankings[2].nickname,
                    time: rankings[2].playTime,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const RankingRow(index: '등수', name: '이름', time: '시간'),
              Expanded(
                child: ListView.separated(
                  itemCount: rankings.length - 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final ranking = rankings[index + 3];
                    return RankingRow(
                      index: '${ranking.rank}',
                      name: ranking.nickname,
                      time: ranking.playTime,
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
      },
    );
  }
}
