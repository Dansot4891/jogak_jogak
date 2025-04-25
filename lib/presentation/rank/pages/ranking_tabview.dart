import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/helper/extension/timer_extension.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/module/state/state_handling.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_action.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_state.dart';
import 'package:jogak_jogak/presentation/rank/widgets/ranking_graph.dart';
import 'package:jogak_jogak/presentation/rank/widgets/ranking_row.dart';

class RankingTabview extends StatelessWidget {
  final int level;
  final RankingState state;
  final void Function(RankingAction action) onAction;
  const RankingTabview({
    required this.level,
    required this.state,
    required this.onAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StateHandling(
      state: state.state,
      init: const BaseLoadingView(),
      loading: const BaseLoadingView(),
      error: BaseErrorView(state.errorMessage),
      success: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.topRight,
              child: IntrinsicWidth(
                child: AppButton(
                  text: '새로고침',
                  onTap: () {
                    onAction(FetchRankings(level, isRefetching: true));
                  },
                  bgColor: AppColor.white,
                  horizontalPadding: 4,
                  verticalPadding: 8,
                  border: Border.all(color: AppColor.grey80),
                  textColor: AppColor.main,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _rankings.length > 3 ? 3 : _rankings.length,
                (index) {
                  return RankingGraph(
                    index: index + 1,
                    name: _rankings[index].nickname,
                    time: _rankings[index].playTime.formattedElapsed(),
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            Divider(color: AppColor.sub),
            const RankingRow(index: '등수', name: '이름', time: '시간'),
            if (_rankings.length > 3)
              Expanded(
                child: ListView.separated(
                  itemCount: _rankings.length - 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final ranking = _rankings[index + 3];
                    return RankingRow(
                      index: '${index + 1}',
                      name: ranking.nickname,
                      time: ranking.playTime.formattedElapsed(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(color: AppColor.sub);
                  },
                ),
              )
            else if (_rankings.length < 3)
              Expanded(
                child: Center(
                  child: Text('현재 등록된 랭킹이 없습니다.', style: AppTextStyle.body1),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // 레벨이 같은 랭킹 추출
  List<Ranking> get _rankings =>
      state.withLevelRanking
          .where((e) => e.level == level)
          .toList()
          .first
          .rankings;
}
