import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/domain/repository/puzzle_repository.dart';

class GetRandomImageUrlUseCase {
  final PuzzleRepository _puzzleRepository;

  GetRandomImageUrlUseCase(this._puzzleRepository);

  Future<Result<PuzzleImage>> getRandomImageUrl() async {
    try {
      final puzzleImage = await _puzzleRepository.getRandomImageUrl();
      if (puzzleImage == null) {
        return const Result.error(FailedToFetchImageException());
      }
      return Result.success(puzzleImage);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
