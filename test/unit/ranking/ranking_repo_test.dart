import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/helper/extension/list_map_extension.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/mock/mock_ranking_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/data/mapper/ranking_mapper.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/data/repository_impl/ranking_repository_impl.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/get_rankings_use_case.dart';

void main() {
  group('ranking repo test', () {
    final mock = [
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 1,
      ),
    ];
    final mockDataSource = MockRankingDataSourceImpl();
    final usecase = GetRankingsUseCase(RankingRepositoryImpl(mockDataSource));
    test('ranking repo test', () async {
      final resp = await usecase.execute(3);

      switch (resp) {
        case Success<List<Ranking>>():
          expect(
            resp.data.first,
            mock.mapToEntityList((e) => e.toRanking()).first,
          );
          break;
        case Error<List<Ranking>>():
          expect(resp.error, 501);
          break;
      }
    });
  });
}
