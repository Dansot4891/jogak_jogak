import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';

abstract interface class RankingRemoteDataSource {
  Future<List<RankingDto>> getRankings(int level);
}
