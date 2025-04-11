import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/ranking/data/entity/ranking_entity.dart';

abstract interface class RankingRepository {
  Future<Result<List<RankingEntity>, CustomException>> getRankings();
}
