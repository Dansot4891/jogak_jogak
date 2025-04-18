import 'package:jogak_jogak/core/helper/extension/list_map_extension.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/remote/ranking_remote_data_source.dart';
import 'package:jogak_jogak/feature/ranking/data/mapper/ranking_mapper.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/repository/ranking_repository.dart';

class RankingRepositoryImpl implements RankingRepository {
  final RankingRemoteDataSource _dataSource;

  RankingRepositoryImpl(this._dataSource);

  @override
  Future<List<Ranking>> getRankings() async {
    final resp = await _dataSource.getRankings();
    final rankings = resp.mapToEntityList((e) => e.toEntity());
    return rankings;
  }
}
