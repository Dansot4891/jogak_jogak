import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/repository/ranking_repository.dart';

class GetRankingsUseCase {
  final RankingRepository _rankingRepository;

  GetRankingsUseCase(this._rankingRepository);

  Future<Result<List<Ranking>>> execute(int level) async {
    try {
      final rankings = await _rankingRepository.getRankings(level);
      return Result.success(rankings);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
