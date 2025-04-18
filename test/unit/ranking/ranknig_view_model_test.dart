import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/mock/mock_ranking_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/repository_impl/ranking_repository_impl.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/get_rankings_use_case.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_view_model.dart';

void main() {
  group('ranking view model test', () {
    late RankingViewModel viewModel;

    final level = 3;

    setUp(() {
      final mockDataSource = MockRankingDataSourceImpl();
      final repository = RankingRepositoryImpl(mockDataSource);
      final useCase = GetRankingsUseCase(repository);
      viewModel = RankingViewModel(useCase)..fetchRankings(level);
    });
    test('ranking view model test', () async {
      // 성공적으로 데이터가 들어왔는지 확인
      expect(
        viewModel.state.withLevelRanking
            .firstWhere((e) => e.level == level)
            .rankings
            .isNotEmpty,
        equals(true),
      );
    });
  });
}
