import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/upload_ranking_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/save_puzzle_history_use_case.dart';
import 'package:jogak_jogak/presentation/puzzle/controller/puzzle_controller.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_action.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class PuzzleViewModel extends ChangeNotifier {
  final UploadRankingUseCase _uploadRankingUseCase;
  final UserProvider _userProvider;
  final SavePuzzleHistoryUseCase _savePuzzleHistoryUseCase;
  final PuzzleController _controller = PuzzleController();
  // state는 불변 객체만 담으므로 타이머는 별개로 구성
  Timer? _timer;

  PuzzleState _state = const PuzzleState();
  PuzzleState get state => _state;

  PuzzleViewModel({
    required UploadRankingUseCase uploadRankingUseCase,
    required UserProvider userProvider,
    required SavePuzzleHistoryUseCase savePuzzleHistoryUseCase,
  }) : _userProvider = userProvider,
       _uploadRankingUseCase = uploadRankingUseCase,
       _savePuzzleHistoryUseCase = savePuzzleHistoryUseCase;

  void onAction(PuzzleAction action) {
    switch (action) {
      case Initialize():
        _initialize();
      case CropImage():
        _cropImage();
      case MatchPiece():
        _matchPiece(action.targetIndex, action.matchIndex);
      case MovePiece():
        _movePiece(
          index: action.index,
          dx: action.dx,
          dy: action.dy,
          horizonPadding: action.horizonPadding,
        );
      case StartTimer():
        _startTimer();
      case Reset():
        _reset();
    }
  }

  // 뷰모델 처음 생성시 시작되는 함수
  // 필요한 데이터 할당
  void _initialize() async {
    await _cropImage();
    _startTimer();
    _state = state.copyWith(
      file: _controller.file,
      pieces: _controller.pieces,
      gridViewSize: _controller.gridViewSize,
      correctPieces: _controller.correctPieces,
    );
    notifyListeners();
  }

  // 이미지 자르기
  Future<void> _cropImage() async {
    await _controller.cropImage();
  }

  // 퍼즐 맞추기
  // targetIndex : 맞추려는 퍼즐 피스
  // matchIndex : 사용자가 집은 퍼즐 피스
  void _matchPiece(int targetIndex, int matchIndex) {
    if (targetIndex == matchIndex) {
      _controller.matchPiece(targetIndex, matchIndex);
      _state = state.copyWith(
        pieces: _controller.pieces,
        correctPieces: _controller.correctPieces,
      );
    }
    // 현재 퍼즐 개수에서 맞춘것과 실제 정답의 개수와 같다면
    // 게임 종료
    if (_state.pieces.where((e) => e.isRight).length ==
        _state.correctPieces.length) {
      _state = state.copyWith(gameOver: true);
    }
    notifyListeners();
  }

  // 퍼즐 이동
  void _movePiece({
    required int index, // match하기위한 index
    required double dx, // 이동된 부분에서의 x 위치
    required double dy, // 이동된 부분에서의 y 위치
    required double horizonPadding, // padding
  }) {
    // 이동된 위치에서 x가
    // 패딩값보단 크고, 전체 너비에서 이미지 너비만큼 뺀 값보단 작아야하고,
    // 이동된 위치에서 y가
    // 56 + 60 + 상단 그리드뷰보단 크고, 전체 높이에서 이미지 높이만큼 뺀 값보단 작아야한다.
    //    => 위 조건들을 만족할 때만 위치를 이동시킨다.
    if ((dx > horizonPadding &&
            dx <
                AppSize.screenWidth -
                    horizonPadding -
                    ((AppSize.screenWidth - horizonPadding * 2) /
                        state.gridViewSize)) &&
        (dy > 56 + 70 + AppSize.screenWidth - 32 &&
            dy <
                AppSize.screenHeight -
                    16 -
                    ((AppSize.screenWidth - 32) / state.gridViewSize))) {
      _controller.movePiece(
        index: index,
        dx: dx,
        dy: dy,
        horizonPadding: horizonPadding,
      );
      notifyListeners();
    }
  }

  // 타이머 시작
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      // 게임오버시 타이머 종료 및 랭킹 데이터 업데이트
      if (_state.gameOver) {
        timer.cancel();
        notifyListeners();

        // UI 먼저 변경 후 랭킹 등록하는 로직은
        // 사용자가 알 수 없도록 뒤에 설정
        final user = _userProvider.state.user;
        // 현재 유저 정보가 없다면 랭킹 업데이트 X
        if (user == null) {
          return;
        }
        final playTime = _timer!.tick;
        final level = _state.gridViewSize;
        final ranking = Ranking(
          nickname: user.username,
          level: level,
          email: user.email,
          playTime: playTime,
        );
        final puzzleHistory = PuzzleHistory(
          level: level,
          playTime: playTime,
          playDate: DateTime.now(),
        );
        await _uploadRankingUseCase.execute(ranking);
        await _savePuzzleHistoryUseCase.execute(puzzleHistory);
      }
      _state = _state.copyWith(elapsedSeconds: state.elapsedSeconds + 1);
      notifyListeners();
    });
  }

  // 데이터 리셋
  void _reset() async {
    _timer?.cancel();
    _timer = null;
    _state = state.copyWith(
      correctPieces: const [],
      pieces: const [],
      elapsedSeconds: 0,
      gameOver: false,
    );
    _controller.reset();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
