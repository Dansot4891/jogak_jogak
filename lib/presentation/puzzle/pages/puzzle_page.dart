import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/util/img_picker.dart';
import 'package:jogak_jogak/feature/puzzle/repository/entity/puzzle_entity.dart';
import 'package:jogak_jogak/feature/puzzle/utils/img_crop.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/empty_box.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/puzzle_piece.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  // 파일
  File? file;

  // 잘린 이미지들의 리스트
  List<PuzzleEntity> pieces = [];
  // 정답 리스트
  List<PuzzleEntity> correctPieces = [];

  // gridview의 n x n 사이즈
  int gridViewSize = 4;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BasePage(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _horizonPadding),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
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
                        correctPieces = List.from(fileList);
                        pieces = List.from(fileList);

                        setState(() {});
                      },
                      child: Text('⚠️ 화면이 잘리면서 원본과 다를 수 있습니다!', style: AppTextStyle.body1.copyWith(color: AppColor.red),),
                    ),
                  ),
                  if (file != null)
                    Image.file(file!, width: 80, height: 80, fit: BoxFit.cover),
                ],
              ),
            ),
            if (pieces.isNotEmpty)
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.width -
                          _horizonPadding * 2,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: gridViewSize * gridViewSize,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: gridViewSize,
                        ),
                        itemBuilder: (context, index) {
                          return DragTarget<int>(
                            // -- builder --
                            builder: (context, candidateData, rejectedData) {
                              final piece = correctPieces[index];
                              return PuzzlePiece(
                                file: piece.file,
                                isFrame: !piece.isRight,
                                gridViewSize: gridViewSize,
                              );
                            },
                            // draagable로부터
                            // 받아들였을 때
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
                                  correctPieces =
                                      correctPieces
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
                                top: e.top,
                                left: e.left,
                                child: Draggable(
                                  data: e.index,
                                  // 드래그 완료 후 상태 위젯
                                  feedback: PuzzlePiece(
                                    file: e.file,
                                    gridViewSize: gridViewSize,
                                  ),
                                  // 드래그중일 때 원래 위젯 위치에 존재할 위젯
                                  childWhenDragging: EmptyBox(),
                                  onDragEnd: (details) {
                                    final dx = details.offset.dx;
                                    final dy = details.offset.dy;
                                    // 이동된 위치에서 x가
                                    // 패딩값보단 크고, 전체 너비에서 이미지 너비만큼 뺀 값보단 작아야하고,
                                    // 이동된 위치에서 y가
                                    // 80 + 상단 그리드뷰보단 크고, 전체 높이에서 이미지 높이만큼 뺀 값보단 작아야한다.
                                    //    => 위 조건들을 만족할 때만 위치를 이동시킨다.
                                    if ((dx > _horizonPadding &&
                                            dx <
                                                AppSize.screenWidth -
                                                    16 -
                                                    ((AppSize.screenWidth -
                                                            32) /
                                                        gridViewSize)) &&
                                        (dy >
                                                80 +
                                                    AppSize.fractionHeight(
                                                      0.5,
                                                    ) &&
                                            dy <
                                                AppSize.screenHeight -
                                                    16 -
                                                    ((AppSize.screenWidth -
                                                            32) /
                                                        gridViewSize))) {
                                      setState(() {
                                        // index가 같은것을 찾아서
                                        final piece = pieces
                                            .where((p) => p.index == e.index)
                                            .first
                                            .copyWith(
                                              // grideview + 상단 height 제외
                                              top:
                                                  details.offset.dy -
                                                  80 -
                                                  AppSize.screenWidth -
                                                  32,
                                              // 왼쪽 margin값 제외
                                              left:
                                                  details.offset.dx -
                                                  _horizonPadding,
                                            );
                                        // 해당 객체를 삭제후
                                        // 리스트 마지막에 추가
                                        //    => 해당 이미지를 stack 내에서 맨 위로 올리기위해서
                                        pieces.remove(piece);
                                        pieces.add(piece);
                                      });
                                    }
                                  },
                                  // 기본 설정 위젯
                                  child: PuzzlePiece(
                                    file: e.file,
                                    gridViewSize: gridViewSize,
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

  double get _horizonPadding => 16;
}
