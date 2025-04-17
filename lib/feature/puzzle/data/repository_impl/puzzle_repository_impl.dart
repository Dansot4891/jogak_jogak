import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/domain/repository/puzzle_repository.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/puzzle_data_source.dart';
import 'package:jogak_jogak/feature/puzzle/data/mapper/puzzle_image_mapper.dart';

class PuzzleRepositoryImpl implements PuzzleRepository {
  final PuzzleDataSource _dataSource;

  PuzzleRepositoryImpl(this._dataSource);

  @override
  Future<Result<PuzzleImage>> getRandomImageUrl() async {
    try {
      final puzzleImageDto = await _dataSource.getRandomImageUrl();
      final puzzleImage = puzzleImageDto.toPuzzleImage();
      if (puzzleImage == null) {
        return const Result.error(FailedToFetchImageException());
      }
      return Result.success(puzzleImage);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
