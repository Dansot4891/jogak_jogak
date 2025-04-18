import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/mock/mock_puzzle_data_source_impl.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/puzzle_data_source.dart';
import 'package:jogak_jogak/feature/puzzle/data/repository_impl/puzzle_repository_impl.dart';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/domain/repository/puzzle_repository.dart';
import 'package:jogak_jogak/feature/puzzle/domain/use_case/get_random_image_url_use_case.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';

void main() {
  group('home view model test', () {
    late HomeViewModel viewModel;

    setUp(() {
      final PuzzleDataSource mockDataSource = MockPuzzleDataSourceImpl();
      final PuzzleRepository repository = PuzzleRepositoryImpl(mockDataSource);
      final useCase = GetRandomImageUrlUseCase(repository);
      viewModel = HomeViewModel(useCase);
    });
    test('home view model test', () async {
      // 처음 상태는 init
      expect(viewModel.state.state, BaseState.init);

      // fetchRankings 호출
      await viewModel.getRandomImageUrl();

      // 성공적으로 데이터가 들어왔는지 확인
      expect(viewModel.state.file, equals(true));
      final currentState = viewModel.state;
      switch (currentState) {
        case Success<PuzzleImage>():
          expect(currentState.state, BaseState.success);
          break;
        case Error<PuzzleImage>():
          expect(currentState.state, BaseState.error);
      }
    });
  });
}
