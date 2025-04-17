import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/puzzle/data/model/puzzle_image.dart';

abstract interface class PuzzleRepository {
  Future<Result<PuzzleImage>> getRandomImageUrl();
}
