import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:jogak_jogak/main.dart';

class PuzzleView extends StatefulWidget {
  const PuzzleView({super.key});

  @override
  State<PuzzleView> createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  File? file;
  List<File> croppedFiles = [];

  int gridViewSize = 6;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () async {
                final imgFile = await ImgPicker.pickImage();
                file = imgFile;
                if (imgFile == null) {
                  return;
                }

                final fileList = await ImgCrop.cropImage(
                  imgFile,
                  gridViewSize: gridViewSize,
                );
                if (fileList == null) {
                  return;
                }
                croppedFiles = fileList;

                setState(() {});
              },
              child: Text('이미지 선택'),
            ),
            if (croppedFiles.isNotEmpty)
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: gridViewSize * gridViewSize,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridViewSize,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    return Image.file(
                      croppedFiles[index],
                      width: width / gridViewSize,
                      height: width / gridViewSize,
                      fit: BoxFit.cover,
                      cacheHeight: (width.cacheSize(context) / gridViewSize).toInt(),
                      cacheWidth: (width.cacheSize(context) / gridViewSize).toInt(),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ImgPicker {
  static Future<File?> pickImage() async {
    final picker = ImagePicker();
    final resp = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: ratio.width,
      maxHeight: ratio.width,
    );
    if (resp == null) {
      return null;
    }
    return File(resp.path);
  }
}

class ImgCrop {
  // 이미지 자르기 후 저장
  static Future<File> saveCroppedImage(
    File file,
    img.Image croppedImage,
    String extension,
  ) async {
    final outputPath =
        '${file.path}_crop_${DateTime.now().millisecondsSinceEpoch}.$extension';
    final outputFile = File(outputPath);

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

    return outputFile;
  }

  static Future<List<File>?> cropImage(File file, {
    required int gridViewSize,
  }) async {
    final List<File> fileList = [];
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
        fileList.add(outputFile);
      }
    }
    return fileList;
  }
}

// ---- extension ----
extension CacheImageExtension on num {
  int cacheSize(BuildContext context) {
    final devicePixel = MediaQuery.of(context).devicePixelRatio;
    return (this * devicePixel).toInt();
  }
}
