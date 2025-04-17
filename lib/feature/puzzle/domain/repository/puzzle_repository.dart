import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';

abstract interface class PuzzleRepository {
  Future<PuzzleImage?> getRandomImageUrl();
}
