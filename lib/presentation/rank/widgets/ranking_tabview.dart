import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/module/state/state_handling.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/remote/ranking_remote_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/repository_impl/ranking_repository_impl.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/get_rankings_use_case.dart';
import 'package:jogak_jogak/presentation/rank/view_model/ranking_view_model.dart';
import 'package:jogak_jogak/presentation/rank/widgets/ranking_graph.dart';
import 'package:jogak_jogak/presentation/rank/widgets/ranking_row.dart';

final _viewModel = RankingViewModel(
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
      listenable: _viewModel,
      builder: (context, child) {
        final state = _viewModel.state;
        final rankings = state.rankings;
        return StateHandling(
          state: state.state,
          init: const BaseLoadingView(),
          loading: const BaseLoadingView(),
          error: BaseErrorView(state.errorMessage),
          success: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    rankings.length > 3 ? 3 : rankings.length,
                    (index) {
                      return RankingGraph(
                        index: rankings[index].rank,
                        name: rankings[index].nickname,
                        time: rankings[index].playTime,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 4),
                Divider(color: AppColor.sub),
                const RankingRow(index: '등수', name: '이름', time: '시간'),
                if (rankings.length > 3)
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
                  )
                else if (rankings.length < 3)
                  Expanded(
                    child: Center(
                      child: Text(
                        '현재 등록된 랭킹이 없습니다.',
                        style: AppTextStyle.body1,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
