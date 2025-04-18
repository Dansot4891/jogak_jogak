import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';

abstract interface class RankingRepository {
  Future<List<Ranking>> getRankings();
}
