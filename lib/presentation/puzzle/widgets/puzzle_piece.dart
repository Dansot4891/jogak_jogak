import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/helper/img_size_extesion.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/empty_box.dart';

class PuzzlePiece extends StatelessWidget {
  final int gridViewSize;
  final File file;
  final bool isFrame;
  final bool isRight;
  const PuzzlePiece({
    required this.file,
    required this.gridViewSize,
    this.isFrame = false,
    this.isRight = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = AppSize.screenWidth;
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
      return EmptyBox();
    }
    return Image.file(
      file,
      width: width / gridViewSize,
      height: width / gridViewSize,
      fit: BoxFit.cover,
      cacheHeight: (width.cacheSize() / gridViewSize).toInt(),
      cacheWidth: (width.cacheSize() / gridViewSize).toInt(),
    );
  }
}
