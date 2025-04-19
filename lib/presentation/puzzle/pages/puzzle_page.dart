import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/helper/extension/timer_extension.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_view_model.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/empty_box.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/puzzle_piece.dart';

class PuzzlePage extends StatefulWidget {
  final PuzzleViewModel viewModel;
  const PuzzlePage(this.viewModel, {super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  @override
  void initState() {
    widget.viewModel.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return BasePage(
          appBar: DefaultAppbar(
            title: '조각조각',
            onTap: () {
              widget.viewModel.reset();
              pop(context);
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: _horizonPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
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
                            '현재 시간: ${(widget.viewModel.state.elapsedSeconds).formattedElapsed()}',
                            style: AppTextStyle.body1,
                          ),
                        ],
                      ),
                      if (widget.viewModel.state.file != null)
                        Image.file(
                          widget.viewModel.state.file!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                    ],
                  ),
                ),
                if (widget.viewModel.state.pieces.isNotEmpty &&
                    !widget.viewModel.state.gameOver)
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
                                widget.viewModel.state.gridViewSize *
                                widget.viewModel.state.gridViewSize,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      widget.viewModel.state.gridViewSize,
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
                                      widget
                                          .viewModel
                                          .state
                                          .correctPieces[index];
                                  return PuzzlePiece(
                                    file: piece.file,
                                    isFrame: !piece.isRight,
                                    gridViewSize:
                                        widget.viewModel.state.gridViewSize,
                                  );
                                },
                                // draagable로부터
                                // 받아들였을 때
                                onAcceptWithDetails: (
                                  DragTargetDetails<int> details,
                                ) {
                                  setState(() {
                                    widget.viewModel.matchPiece(
                                      index,
                                      details.data,
                                    );
                                  });
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children:
                                widget.viewModel.state.pieces.map((e) {
                                  return Positioned(
                                    top: e.top,
                                    left: e.left,
                                    child: Draggable(
                                      data: e.index,
                                      // 드래그 완료 후 상태 위젯
                                      feedback: PuzzlePiece(
                                        file: e.file,
                                        gridViewSize:
                                            widget.viewModel.state.gridViewSize,
                                      ),
                                      // 드래그중일 때 원래 위젯 위치에 존재할 위젯
                                      childWhenDragging: const EmptyBox(),
                                      onDragEnd: (details) {
                                        final dx = details.offset.dx;
                                        final dy = details.offset.dy;
                                        widget.viewModel.movePiece(
                                          index: e.index,
                                          dx: dx,
                                          dy: dy,
                                          horizonPadding: _horizonPadding,
                                        );
                                      },
                                      // 기본 설정 위젯
                                      child: PuzzlePiece(
                                        file: e.file,
                                        gridViewSize:
                                            widget.viewModel.state.gridViewSize,
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
                if (widget.viewModel.state.gameOver)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImage.clear,
                            width: AppSize.fractionHeight(0.2),
                            height: AppSize.fractionHeight(0.2),
                          ),
                          Text('퍼즐, 클리어!', style: AppTextStyle.title1),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  double get _horizonPadding => 16;
}
