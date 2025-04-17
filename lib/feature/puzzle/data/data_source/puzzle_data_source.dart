import 'package:jogak_jogak/feature/puzzle/domain/dto/puzzle_image_dto.dart';

abstract interface class PuzzleDataSource {
  Future<void> savePuzzleResult();

  Future<PuzzleImageDto> getRandomImageUrl();
}
