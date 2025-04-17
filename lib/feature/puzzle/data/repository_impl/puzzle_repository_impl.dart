import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/domain/repository/puzzle_repository.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/puzzle_data_source.dart';
import 'package:jogak_jogak/feature/puzzle/data/mapper/puzzle_image_mapper.dart';

class PuzzleRepositoryImpl implements PuzzleRepository {
  final PuzzleDataSource _dataSource;

  PuzzleRepositoryImpl(this._dataSource);

  @override
  Future<PuzzleImage?> getRandomImageUrl() async {
    final puzzleImageDto = await _dataSource.getRandomImageUrl();
    final puzzleImage = puzzleImageDto.toPuzzleImage();
    return puzzleImage;
  }
}
