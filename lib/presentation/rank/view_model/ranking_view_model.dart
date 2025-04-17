import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/repository/ranking_repository.dart';

class RankingViewModel with ChangeNotifier {
  final RankingRepository _rankingRepo;

  RankingViewModel(this._rankingRepo) {
    fetchRankings();
  }

  List<Ranking> _rankings = [];

  List<Ranking> get rankings => _rankings;

  void fetchRankings() async {
    final resp = await _rankingRepo.getRankings();
    switch (resp) {
      case Success():
        _rankings = resp.data;
        break;
      case Error():
        break;
    }
    notifyListeners();
  }
}
