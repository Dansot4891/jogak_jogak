import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/extension/timer_extension.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_action.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_state.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/empty_box.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/game_over_view.dart';
import 'package:jogak_jogak/presentation/puzzle/widgets/puzzle_piece.dart';

class PuzzlePage extends StatefulWidget {
  final PuzzleState state;
  final void Function(PuzzleAction action) onAction;
  const PuzzlePage({required this.state, required this.onAction, super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: DefaultAppbar(
        title: LocaleKeys.appName.tr(),
        onTap: () {
          widget.onAction(const Reset());
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
                        LocaleKeys.inGameCroppedScreen.tr(),
                        style: AppTextStyle.body1.copyWith(color: AppColor.red),
                      ),
                      Text(
                        LocaleKeys.inGameCurrentTime.tr(
                          namedArgs: {
                            'seconds':
                                widget.state.elapsedSeconds.formattedElapsed(),
                          },
                        ),
                        style: AppTextStyle.body1,
                      ),
                    ],
                  ),
                  if (widget.state.file != null)
                    Image.file(
                      widget.state.file!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                ],
              ),
            ),
            if (widget.state.pieces.isNotEmpty && !widget.state.gameOver)
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
                            widget.state.gridViewSize *
                            widget.state.gridViewSize,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: widget.state.gridViewSize,
                        ),
                        itemBuilder: (context, index) {
                          return DragTarget<int>(
                            // -- builder --
                            builder: (context, candidateData, rejectedData) {
                              final piece = widget.state.correctPieces[index];
                              return PuzzlePiece(
                                file: piece.file,
                                isFrame: !piece.isRight,
                                gridViewSize: widget.state.gridViewSize,
                              );
                            },
                            // draagable로부터
                            // 받아들였을 때
                            onAcceptWithDetails: (
                              DragTargetDetails<int> details,
                            ) {
                              widget.onAction(MatchPiece(index, details.data));
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children:
                            widget.state.pieces.map((e) {
                              return Positioned(
                                top: e.top,
                                left: e.left,
                                child: Draggable(
                                  data: e.index,
                                  // 드래그 완료 후 상태 위젯
                                  feedback: PuzzlePiece(
                                    file: e.file,
                                    gridViewSize: widget.state.gridViewSize,
                                  ),
                                  // 드래그중일 때 원래 위젯 위치에 존재할 위젯
                                  childWhenDragging: const EmptyBox(),
                                  onDragEnd: (details) {
                                    final dx = details.offset.dx;
                                    final dy = details.offset.dy;
                                    widget.onAction(
                                      MovePiece(
                                        index: e.index,
                                        dx: dx,
                                        dy: dy,
                                        horizonPadding: _horizonPadding,
                                      ),
                                    );
                                  },
                                  // 기본 설정 위젯
                                  child: PuzzlePiece(
                                    file: e.file,
                                    gridViewSize: widget.state.gridViewSize,
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
            if (widget.state.gameOver)
              GameOverView(isCertified: widget.state.isCertified),
          ],
        ),
      ),
    );
  }

  double get _horizonPadding => 16;
}
