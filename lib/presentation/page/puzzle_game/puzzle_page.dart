// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import 'package:jogak_jogak/main.dart';
import 'package:jogak_jogak/presentation/page/base/base_page.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  // 파일
  File? file;

  // 잘린 이미지들의 리스트
  List<ImagePuzzle> pieces = [];

  // gridview의 n x n 사이즈
  int gridViewSize = 4;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BasePage(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  width: width,
                );
                if (fileList == null) {
                  return;
                }
                pieces = fileList;
      
                setState(() {});
              },
              child: Text('이미지 선택 이미지 선택 이미지 선택 이미지 선택'),
            ),
            if (pieces.isNotEmpty)
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: gridViewSize * gridViewSize,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: gridViewSize,
                            ),
                        itemBuilder: (context, index) {
                          return DragTarget<int>(
                            builder: (context, candidateData, rejectedData) {
                              final piece = pieces[index];
                              return imagePuzzlePiece(
                                file: piece.file,
                                width: width,
                                isFrame: !piece.isRight,
                              );
                            },
                            onAcceptWithDetails: (
                              DragTargetDetails<int> details,
                            ) {
                              if (index == details.data) {
                                setState(() {
                                  pieces =
                                      pieces
                                          .map(
                                            (e) =>
                                                e.index == details.data
                                                    ? e.copyWith(
                                                      isRight: !e.isRight,
                                                    )
                                                    : e,
                                          )
                                          .toList();
                                });
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children:
                            pieces.map((e) {
                              return Positioned(
                                top: e.topRandom,
                                left: e.leftRandom,
                                child: Draggable(
                                  data: e.index,
                                  feedback: imagePuzzlePiece(
                                    file: e.file,
                                    width: width,
                                  ),
                                  childWhenDragging: emptyBox(),
                                  child: imagePuzzlePiece(
                                    file: e.file,
                                    width: width,
                                    isRight: e.isRight,
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  SizedBox emptyBox() {
    return SizedBox();
  }

  // 이미지 퍼즐 조각 위젯
  // file과 너비를 변수로 받음
  Widget imagePuzzlePiece({
    required File file,
    required double width,
    bool isFrame = false,
    bool isRight = false,
  }) {
    // 퍼즐틀일 경우 테두리만 가진 박스 반환
    if (isFrame) {
      return Container(
        width: (width / gridViewSize),
        height: (width / gridViewSize),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      );
    }
    // 하단 퍼즐 조각에서
    // 정답이라면 SizedBox 반환
    if (isRight) {
      return emptyBox();
    }
    return Image.file(
      file,
      width: width / gridViewSize,
      height: width / gridViewSize,
      fit: BoxFit.cover,
      cacheHeight: (width.cacheSize(context) / gridViewSize).toInt(),
      cacheWidth: (width.cacheSize(context) / gridViewSize).toInt(),
    );
  }
}

class ImgPicker {
  // 이미지를 사용자 핸드폰으로부터 가져오기
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
  // image를 자르는 함수
  static Future<List<ImagePuzzle>?> cropImage(
    File file, {
    // 그리드뷰 사이즈 n x n
    required int gridViewSize,
    required double width,
  }) async {
    final List<ImagePuzzle> fileList = [];
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
        final topRandom = 10 + Random().nextDouble() * width / 3 * 2;
        final leftRandom = 10 + Random().nextDouble() * width / 3 * 2;
        final imgPuzzle = ImagePuzzle(
          index: index,
          file: outputFile,
          topRandom: topRandom,
          leftRandom: leftRandom,
        );
        index++;
        fileList.add(imgPuzzle);
      }
    }
    return fileList;
  }
}

// ---- image cache size extension ----
extension CacheImageExtension on num {
  int cacheSize(BuildContext context) {
    final devicePixel = MediaQuery.of(context).devicePixelRatio;
    return (this * devicePixel).toInt();
  }
}

class ImagePuzzle {
  final int index;
  final File file;
  final bool isRight;
  final double topRandom;
  final double leftRandom;

  const ImagePuzzle({
    required this.index,
    required this.file,
    required this.topRandom,
    required this.leftRandom,
    this.isRight = false,
  });

  ImagePuzzle copyWith({
    int? index,
    File? file,
    bool? isRight,
    double? topRandom,
    double? leftRandom,
  }) {
    return ImagePuzzle(
      index: index ?? this.index,
      file: file ?? this.file,
      isRight: isRight ?? this.isRight,
      topRandom: topRandom ?? this.topRandom,
      leftRandom: leftRandom ?? this.leftRandom,
    );
  }
}
