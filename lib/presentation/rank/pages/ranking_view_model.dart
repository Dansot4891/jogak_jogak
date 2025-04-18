import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/get_rankings_use_case.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_state.dart';

class RankingViewModel with ChangeNotifier {
  final GetRankingsUseCase _getRankingsUseCase;

  RankingViewModel(this._getRankingsUseCase);

  RankingState _state = const RankingState();
  RankingState get state => _state;

  Future<void> fetchRankings(int level) async {
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
        break;
      case Error():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: result.error.message,
        );
        break;
    }
    notifyListeners();
  }
}
