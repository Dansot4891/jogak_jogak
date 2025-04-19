import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/repository/ranking_repository.dart';

class UploadRankingUseCase {
  final RankingRepository _rankingRepository;

  UploadRankingUseCase(this._rankingRepository);

  Future<Result<void>> execute(Ranking ranking) async {
    try {
      final resp = await _rankingRepository.uploadRanking(ranking);
      return Result.success(resp);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
