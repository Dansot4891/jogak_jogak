import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';

abstract interface class RankingRepository {
  Future<Result<List<Ranking>>> getRankings();
}
