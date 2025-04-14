import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/presentation/puzzle/controller/puzzle_controller.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_state.dart';

class PuzzleViewModel extends ChangeNotifier {
  final PuzzleController _controller = PuzzleController();
  Timer? _timer;

  PuzzleState _state = const PuzzleState();
  PuzzleState get state => _state;

  PuzzleViewModel() {
    _initialize();
  }

  // 뷰모델 처음 생성시 시작되는 함수
  // 필요한 데이터 할당
  void _initialize() async {
    await cropImage();
    startTimer();
    _state = state.copyWith(
      file: _controller.file,
      pieces: _controller.pieces,
      gridViewSize: _controller.gridViewSize,
      correctPieces: _controller.correctPieces,
    );
    notifyListeners();
  }

  // 이미지 자르기
  Future<void> cropImage() async {
    await _controller.cropImage();
  }

  // 퍼즐 맞추기
  // targetIndex : 맞추려는 퍼즐 피스
  // matchIndex : 사용자가 집은 퍼즐 피스
  void matchPiece(int targetIndex, int matchIndex) {
    if (targetIndex == matchIndex) {
      _controller.matchPiece(targetIndex, matchIndex);
    }
    if (_state.correctPieces == _state.elapsedSeconds) {}
    notifyListeners();
  }

  // 퍼즐 이동
  void movePiece({
    required int index, // match하기위한 index
    required double dx, // 이동된 부분에서의 x 위치
    required double dy, // 이동된 부분에서의 y 위치
    required double horizonPadding, // padding
  }) {
    _controller.movePiece(
      index: index,
      dx: dx,
      dy: dy,
      horizonPadding: horizonPadding,
    );
    notifyListeners();
  }

  // 타이머 시작
  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.elapsedSeconds >= 0) {
        _state = _state.copyWith(elapsedSeconds: state.elapsedSeconds + 1);
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
