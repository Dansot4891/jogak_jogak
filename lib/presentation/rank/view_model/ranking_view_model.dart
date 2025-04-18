import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/get_rankings_use_case.dart';

class RankingViewModel with ChangeNotifier {
  final GetRankingsUseCase _getRankingsUseCase;

  RankingViewModel(this._getRankingsUseCase) {
    fetchRankings();
  }

  List<Ranking> _rankings = [];

  List<Ranking> get rankings => _rankings;

  void fetchRankings() async {
    final result = await _getRankingsUseCase.execute();
    switch (result) {
      case Success():
        _rankings = result.data;
        break;
      case Error():
        break;
    }
    notifyListeners();
  }
}
