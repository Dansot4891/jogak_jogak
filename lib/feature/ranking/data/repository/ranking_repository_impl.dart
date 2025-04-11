import 'package:jogak_jogak/core/helper/list_map_extension.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/ranking/domain/data_source/remote/ranking_remote_data_source.dart';
import 'package:jogak_jogak/feature/ranking/domain/mapper/ranking_mapper.dart';
import 'package:jogak_jogak/feature/ranking/data/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/data/repository/ranking_repository.dart';

class RankingRepositoryImpl implements RankingRepository {
  final RankingRemoteDataSource _dataSource;

  RankingRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Ranking>, CustomException>> getRankings() async {
    try {
      final resp = await _dataSource.getRankings();
      final rankings = resp.mapToEntityList((e) => e.toEntity());
      return Success(rankings);
    } catch (e) {
      return const Error(UnexpectedException());
    }
  }
}
