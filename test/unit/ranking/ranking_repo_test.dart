import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/helper/list_map_extension.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/mock/mock_ranking_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/model/ranking_model.dart';
import 'package:jogak_jogak/feature/ranking/data/mapper/ranking_mapper.dart';
import 'package:jogak_jogak/feature/ranking/domain/entity/ranking_entity.dart';
import 'package:jogak_jogak/feature/ranking/domain/repository/ranking_repository_impl.dart';

void main() {
  group('ranking repo test', () {
    final mock = [
      const RankingModel(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 3,
      ),
    ];
    final mockDataSource = MockRankingDataSourceImpl();
    final repo = RankingRepositoryImpl(mockDataSource);
    test('ranking repo test', () async {
      final resp = await repo.getRankings();

      switch (resp) {
        case Success<List<RankingEntity>, CustomException>():
          expect(resp.data, mock.mapToEntityList((e) => e.toEntity()));
          break;
        case Error<List<RankingEntity>, CustomException>():
          expect(resp.error, 501);
          break;
      }
    });
  });
}
