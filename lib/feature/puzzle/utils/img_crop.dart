
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:jogak_jogak/core/module/random/random_generator.dart';
import 'package:jogak_jogak/feature/puzzle/repository/entity/puzzle_entity.dart';

class ImgCrop {
  // image를 자르는 함수
  static Future<List<PuzzleEntity>?> cropImage(
    File file, {
    // 그리드뷰 사이즈 n x n
    required int gridViewSize,
    required double width,
  }) async {
    final randomGenerator = RandomGenerator();
    final List<PuzzleEntity> fileList = [];
    // 이미지의 width, height를 가져오기 위해 파일 읽기
    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);

    // 이미지 변환중 에러시 null return
    if (image == null) {
      return null;
    }

    // 이미지를 9등분으로 자르기
    final pieceWidth = image.width ~/ gridViewSize;
    final pieceHeight = image.height ~/ gridViewSize;

    // 더 작은 길이를 하나의 길이로 설정
    final pieceSize = pieceWidth >= pieceHeight ? pieceHeight : pieceWidth;
    int index = 0;

    // 자른 이미지들을 리스트에 추가
    for (int y = 0; y < gridViewSize; y++) {
      for (int x = 0; x < gridViewSize; x++) {
        final croppedImage = img.copyCrop(
          image,
          x: x * pieceSize,
          y: y * pieceSize,
          width: pieceSize,
          height: pieceSize,
        );

        // 이미지 파일명 추가 및 파일 추출
        final extension = file.path.split('.').last;
        final outputPath =
            '${file.path}_crop_${DateTime.now().millisecondsSinceEpoch}.$extension';
        final outputFile = File(outputPath);

        // 파일 확장자에 따라 이미지 할당
        switch (extension) {
          case 'jpg':
            await outputFile.writeAsBytes(img.encodeJpg(croppedImage));
            break;
          case 'png':
            await outputFile.writeAsBytes(img.encodePng(croppedImage));
            break;
          default:
            throw Exception('지원되지 않는 확장자');
        }
        final topRandom = randomGenerator.nextDouble(width / 3 * 2, seed: 10);
        final leftRandom = randomGenerator.nextDouble(width / 3 * 2, seed: 10);
        final imgPuzzle = PuzzleEntity(
          index: index,
          file: outputFile,
          top: topRandom,
          left: leftRandom,
        );
        index++;
        fileList.add(imgPuzzle);
      }
    }
    return fileList;
  }
}