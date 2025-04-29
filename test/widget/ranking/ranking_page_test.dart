import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/with_level_ranking.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_action.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_state.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_tabview.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Easy Localization Test를 위한 세팅
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();

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

  final ranking = EasyLocalization(
    supportedLocales: const [Locale('ko', 'KR'), Locale('en', 'US')],
    path: 'assets/translations',
    fallbackLocale: const Locale('ko', 'KR'),
    child: MaterialApp(
      home: Builder(
        builder: (context) {
          AppSize.init(context);
          return Scaffold(
            body: RankingTabview(level: 3, state: state, onAction: onAction),
          );
        },
      ),
    ),
  );
  testWidgets('Ranking find text', (tester) async {
    await tester.pumpWidget(ranking);

    expect(find.textContaining(LocaleKeys.rankingRefresh.tr()), findsOneWidget);
    expect(find.textContaining(LocaleKeys.rankingRank.tr()), findsOneWidget);
    expect(find.textContaining(LocaleKeys.rankingName.tr()), findsOneWidget);
    expect(find.textContaining(LocaleKeys.rankingTime.tr()), findsOneWidget);
  });
}
