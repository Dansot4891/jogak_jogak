import 'dart:io';

import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/helper/img_picker/img_picker.dart';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle.dart';
import 'package:jogak_jogak/feature/puzzle/utils/img_crop.dart';

class PuzzleController {
  PuzzleController();

  // 파일
  File? file;
  // 잘린 이미지들의 리스트
  List<Puzzle> pieces = [];
  // 정답 리스트
  List<Puzzle> correctPieces = [];
  // gridview의 n x n 사이즈
  int gridViewSize = 3;

  // 이미지 선택
  Future<void> selectImage({File? obtainedFile}) async {
    if (obtainedFile != null) {
      file = obtainedFile;
      return;
    }
    final imgFile = await ImgPicker.pickImage();
    file = imgFile;
    if (imgFile == null) {
      return;
    }
  }

  // 이미지 삭제
  void removePuzzle() {
    file = null;
  }

  // 이미지 자르기
  Future<void> cropImage() async {
    // 앞에서 무조건 이미지가 선택되어야 한다.
    // 파일이 없으면 종료
    if (file == null) {
      return;
    }
    final fileList = await ImgCrop.cropImage(
      file!,
      gridViewSize: gridViewSize,
      width: AppSize.screenWidth,
      height: AppSize.screenHeight,
    );
    if (fileList == null) {
      return;
    }
    correctPieces = List.from(fileList);
    pieces = List.from(fileList);
  }

  // 난이도 변경
  void selectLevel(int level) {
    gridViewSize = level;
  }

  // 퍼즐 맞추기
  // targetIndex : 맞추려는 퍼즐 피스
  // matchIndex : 사용자가 집은 퍼즐 피스
  void matchPiece(int targetIndex, int matchIndex) {
    pieces =
        pieces
            .map(
              (e) =>
                  e.index == matchIndex ? e.copyWith(isRight: !e.isRight) : e,
            )
            .toList();
    correctPieces =
        correctPieces
            .map(
              (e) =>
                  e.index == matchIndex ? e.copyWith(isRight: !e.isRight) : e,
            )
            .toList();
  }

  // 퍼즐 이동
  void movePiece({
    required int index, // match하기위한 index
    required double dx, // 이동된 부분에서의 x 위치
    required double dy, // 이동된 부분에서의 y 위치
    required double horizonPadding, // padding
  }) {
    // index가 같은것을 찾아서
    final piece = pieces
        .where((p) => p.index == index)
        .first
        .copyWith(
          // grideview + padding + 상단 height 제외
          top: dy - 56 - 70 - AppSize.screenWidth - (2 * horizonPadding),
          // 왼쪽 margin값 제외
          left: dx - horizonPadding,
        );
    // 해당 객체를 삭제후
    // 리스트 마지막에 추가
    //    => 해당 이미지를 stack 내에서 맨 위로 올리기위해서
    pieces.remove(piece); // 값을 찾아서 제거
    pieces.add(piece); // 맨 뒤로 삽입
  }

  void withFileReset() {
    file = null;
    reset();
  }

  void reset() {
    pieces = const [];
    correctPieces = const [];
  }
}
