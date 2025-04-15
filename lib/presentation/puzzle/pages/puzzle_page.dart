import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_view_model.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/empty_box.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/puzzle_piece.dart';

final viewModel = PuzzleViewModel();

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: _horizonPadding),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '⚠️ 화면이 잘리면서 원본과 다를 수 있습니다!',
                            style: AppTextStyle.body1.copyWith(
                              color: AppColor.red,
                            ),
                          ),
                          Text(
                            '현재 시간: ${viewModel.state.elapsedSeconds}',
                            style: AppTextStyle.body1,
                          ),
                        ],
                      ),
                      if (viewModel.state.file != null)
                        Image.file(
                          viewModel.state.file!,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                    ],
                  ),
                ),
                if (viewModel.state.pieces.isNotEmpty)
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.width -
                              _horizonPadding * 2,
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount:
                                viewModel.state.gridViewSize *
                                viewModel.state.gridViewSize,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: viewModel.state.gridViewSize,
                                ),
                            itemBuilder: (context, index) {
                              return DragTarget<int>(
                                // -- builder --
                                builder: (
                                  context,
                                  candidateData,
                                  rejectedData,
                                ) {
                                  final piece =
                                      viewModel.state.correctPieces[index];
                                  return PuzzlePiece(
                                    file: piece.file,
                                    isFrame: !piece.isRight,
                                    gridViewSize: viewModel.state.gridViewSize,
                                  );
                                },
                                // draagable로부터
                                // 받아들였을 때
                                onAcceptWithDetails: (
                                  DragTargetDetails<int> details,
                                ) {
                                  setState(() {
                                    viewModel.matchPiece(index, details.data);
                                  });
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children:
                                viewModel.state.pieces.map((e) {
                                  return Positioned(
                                    top: e.top,
                                    left: e.left,
                                    child: Draggable(
                                      data: e.index,
                                      // 드래그 완료 후 상태 위젯
                                      feedback: PuzzlePiece(
                                        file: e.file,
                                        gridViewSize:
                                            viewModel.state.gridViewSize,
                                      ),
                                      // 드래그중일 때 원래 위젯 위치에 존재할 위젯
                                      childWhenDragging: const EmptyBox(),
                                      onDragEnd: (details) {
                                        final dx = details.offset.dx;
                                        final dy = details.offset.dy;
                                        // 이동된 위치에서 x가
                                        // 패딩값보단 크고, 전체 너비에서 이미지 너비만큼 뺀 값보단 작아야하고,
                                        // 이동된 위치에서 y가
                                        // 80 + 상단 그리드뷰보단 크고, 전체 높이에서 이미지 높이만큼 뺀 값보단 작아야한다.
                                        //    => 위 조건들을 만족할 때만 위치를 이동시킨다.
                                        viewModel.movePiece(
                                          index: e.index,
                                          dx: dx,
                                          dy: dy,
                                          horizonPadding: _horizonPadding,
                                        );
                                        {
                                          // // index가 같은것을 찾아서
                                          // final piece = _controller.pieces
                                          //     .where((p) => p.index == e.index)
                                          //     .first
                                          //     .copyWith(
                                          //       // grideview + 상단 height 제외
                                          //       top:
                                          //           details.offset.dy -
                                          //           80 -
                                          //           AppSize.screenWidth -
                                          //           32,
                                          //       // 왼쪽 margin값 제외
                                          //       left:
                                          //           details.offset.dx -
                                          //           _horizonPadding,
                                          //     );
                                          // // 해당 객체를 삭제후
                                          // // 리스트 마지막에 추가
                                          // //    => 해당 이미지를 stack 내에서 맨 위로 올리기위해서
                                          // pieces.remove(piece);
                                          // pieces.add(piece);
                                        }
                                      },
                                      // 기본 설정 위젯
                                      child: PuzzlePiece(
                                        file: e.file,
                                        gridViewSize:
                                            viewModel.state.gridViewSize,
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
          );
        },
      ),
    );
  }

  double get _horizonPadding => 16;
}
