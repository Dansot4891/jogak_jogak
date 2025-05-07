import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/constants/app_data.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/with_level_ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/get_rankings_use_case.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_action.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_state.dart';

class RankingViewModel with ChangeNotifier {
  final GetRankingsUseCase _getRankingsUseCase;

  RankingViewModel(this._getRankingsUseCase);

  RankingState _state = RankingState(
    withLevelRanking:
        AppData.levels.map((e) => WithLevelRanking(level: e)).toList(),
  );
  RankingState get state => _state;

  void onAction(RankingAction action) {
    switch (action) {
      case FetchRankings():
        _fetchRankings(action.level, isRefetching: action.isRefetching);
    }
  }

  void _fetchRankings(int level, {bool isRefetching = false}) async {
    if (_state.withLevelRanking
            .where((e) => e.level == level)
            .first
            .rankings
            .isNotEmpty &&
        !isRefetching) {
      return;
    }
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _getRankingsUseCase.execute(level);
    switch (result) {
      case Success():
        _state = state.copyWith(
          withLevelRanking:
              state.withLevelRanking
                  .map(
                    (e) =>
                        e.level == level
                            ? e.copyWith(rankings: result.data)
                            : e,
                  )
                  .toList(),
          state: BaseState.success,
        );
      case Error():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: result.error.message,
        );
    }
    notifyListeners();
  }
}
