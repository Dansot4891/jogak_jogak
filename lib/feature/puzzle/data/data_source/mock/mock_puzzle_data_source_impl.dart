import 'package:jogak_jogak/feature/puzzle/data/data_source/puzzle_data_source.dart';
import 'package:jogak_jogak/feature/puzzle/data/dto/puzzle_image_dto.dart';

class MockPuzzleDataSourceImpl implements PuzzleDataSource {
  @override
  Future<PuzzleImageDto> getRandomImageUrl() async {
    return PuzzleImageDto(
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/10/13/11/44/cat-6706354_1280.jpg',
      source: 'pixabay',
    );
  }

  @override
  Future<void> savePuzzleResult() {
    // TODO: implement savePuzzleResult
    throw UnimplementedError();
  }
}
