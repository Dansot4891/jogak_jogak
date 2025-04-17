import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';

abstract interface class PuzzleRepository {
  Future<Result<PuzzleImage>> getRandomImageUrl();
}
