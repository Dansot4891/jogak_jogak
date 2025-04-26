import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/with_level_ranking.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_action.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_state.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_tabview.dart';

void main() {
  final state = const RankingState(
    state: BaseState.success,
    withLevelRanking: [
      WithLevelRanking(
        level: 3,
        rankings: [
          Ranking(
            nickname: 'nickname',
            level: 3,
            email: 'email',
            playTime: 205,
          ),
        ],
      ),
      WithLevelRanking(level: 4),
      WithLevelRanking(level: 5),
    ],
  );
  void onAction(RankingAction action) {}

  final ranking = MaterialApp(
    home: Builder(
      builder: (context) {
        AppSize.init(context);
        return Scaffold(
          body: RankingTabview(level: 3, state: state, onAction: onAction),
        );
      },
    ),
  );
  testWidgets('Ranking find text', (tester) async {
    await tester.pumpWidget(ranking);

    expect(find.textContaining('새로고침'), findsOneWidget);
    expect(find.textContaining('등수'), findsOneWidget);
    expect(find.textContaining('이름'), findsOneWidget);
    expect(find.textContaining('시간'), findsOneWidget);
  });
}
