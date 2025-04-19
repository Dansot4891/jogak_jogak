import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/upload_ranking.dart';

abstract interface class RankingRepository {
  Future<List<Ranking>> getRankings(int level);

  Future<void> uploadRanking(UploadRanking uploadRanking);
}
