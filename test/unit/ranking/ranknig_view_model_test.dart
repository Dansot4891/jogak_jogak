import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/helper/extension/list_map_extension.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/mock/mock_ranking_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/data/mapper/ranking_mapper.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/data/repository_impl/ranking_repository_impl.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/get_rankings_use_case.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_view_model.dart';

void main() {
  group('ranking view model test', () {
    late RankingViewModel viewModel;
    // Mock 데이터
    final mockDtos = [
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 1,
      ),
    ];
    final model = mockDtos.mapToEntityList((e) => e.toEntity());

    setUp(() {
      final mockDataSource = MockRankingDataSourceImpl();
      final repository = RankingRepositoryImpl(mockDataSource);
      final useCase = GetRankingsUseCase(repository);
      viewModel = RankingViewModel(useCase);
    });
    test('ranking view model test', () async {
      // 처음 상태는 init
      expect(viewModel.state, BaseState.init);

      // fetchRankings 호출
      await viewModel.fetchRankings(3);

      // 성공적으로 데이터가 들어왔는지 확인
      expect(viewModel.state.rankings.isNotEmpty, equals(true));
      final currentState = viewModel.state;
      switch (currentState) {
        case Success<List<Ranking>>():
          expect(currentState.rankings, model);
          break;
        case Error<List<Ranking>>():
          expect(currentState.state, BaseState.error);
      }
    });
  });
}
