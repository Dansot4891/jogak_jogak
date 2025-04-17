import 'package:jogak_jogak/feature/puzzle/data/dto/puzzle_image_dto.dart';

abstract interface class PuzzleDataSource {
  Future<void> savePuzzleResult();

  Future<PuzzleImageDto> getRandomImageUrl();
}
