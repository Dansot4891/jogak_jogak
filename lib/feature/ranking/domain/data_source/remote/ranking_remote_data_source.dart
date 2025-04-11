import 'package:jogak_jogak/feature/ranking/domain/dto/ranking_dto.dart';

abstract interface class RankingRemoteDataSource {
  Future<List<RankingDto>> getRankings();
}
