import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/mock/mock_puzzle_data_source_impl.dart';
import 'package:jogak_jogak/feature/puzzle/data/dto/puzzle_image_dto.dart';
import 'package:jogak_jogak/feature/puzzle/data/repository_impl/puzzle_repository_impl.dart';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/domain/use_case/get_random_image_url_use_case.dart';

void main() {
  group('puzzle image repo test', () {
    final mock = PuzzleImageDto(
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/10/13/11/44/cat-6706354_1280.jpg',
      source: 'pixabay',
    );
    final mockDataSource = MockPuzzleDataSourceImpl();
    final usecase = GetRandomImageUrlUseCase(
      PuzzleRepositoryImpl(mockDataSource),
    );
    test('puzzle image repo test', () async {
      final resp = await usecase.execute();

      switch (resp) {
        case Success<PuzzleImage>():
          expect(resp.data.imageUrl, mock.imageUrl);
          expect(resp.data.source, mock.source);
          break;
        case Error<PuzzleImage>():
          if (resp.error is FailedToFetchImageException) {
            expect(resp.error.code, 509);
          }
          if (resp.error is UnexpectedException) {
            expect(resp.error.code, 501);
          }
          break;
      }
    });
  });
}
