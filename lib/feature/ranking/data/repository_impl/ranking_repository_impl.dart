import 'package:jogak_jogak/core/helper/extension/list_map_extension.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/ranking_data_source.dart';
import 'package:jogak_jogak/feature/ranking/data/mapper/ranking_mapper.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/repository/ranking_repository.dart';

class RankingRepositoryImpl implements RankingRepository {
  final RankingDataSource _dataSource;

  RankingRepositoryImpl(this._dataSource);

  @override
  Future<List<Ranking>> getRankings(int level) async {
    final resp = await _dataSource.getRankings(level);
    final rankings = resp.mapToEntityList((e) => e.toRanking());
    return rankings;
  }

  @override
  Future<void> uploadRanking(Ranking ranking) async {
    return await _dataSource.uploadRanking(ranking.toRankingDto());
  }
}
