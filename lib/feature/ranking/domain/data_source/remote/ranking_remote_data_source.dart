import 'package:jogak_jogak/feature/ranking/domain/model/ranking_model.dart';

abstract interface class RankingRemoteDataSource {
  Future<List<RankingModel>> getRankings();
}
