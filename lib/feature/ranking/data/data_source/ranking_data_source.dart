import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/data/dto/upload_ranking_dto.dart';

abstract interface class RankingDataSource {
  Future<List<RankingDto>> getRankings(int level);
  Future<void> uploadRanking(UploadRankingDto uploadRanking);
}
