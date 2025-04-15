import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/puzzle/data/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/domain/dto/puzzle_image_dto.dart';

extension PuzzleImageMapper on PuzzleImageDto {
  PuzzleImage toPuzzleImage() {
    if (imageUrl == null) {
      throw const FailedToFetchImageException();
    }
    return PuzzleImage(imageUrl: imageUrl!, source: source ?? '');
  }
}
