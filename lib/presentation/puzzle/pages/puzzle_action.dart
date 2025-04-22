sealed class PuzzleAction {
  const factory PuzzleAction.initialize() = Initialize;

  const factory PuzzleAction.cropImage() = CropImage;

  const factory PuzzleAction.matchPiece(int targetIndex, int matchIndex) =
      MatchPiece;

  const factory PuzzleAction.movePiece({
    required int index, // match하기위한 index
    required double dx, // 이동된 부분에서의 x 위치
    required double dy, // 이동된 부분에서의 y 위치
    required double horizonPadding, // padding
  }) = MovePiece;

  const factory PuzzleAction.startTimer() = StartTimer;

  const factory PuzzleAction.reset() = Reset;
}

class Initialize implements PuzzleAction {
  const Initialize();
}

class CropImage implements PuzzleAction {
  const CropImage();
}

class MatchPiece implements PuzzleAction {
  final int targetIndex;
  final int matchIndex;
  const MatchPiece(this.targetIndex, this.matchIndex);
}

class MovePiece implements PuzzleAction {
  final int index;
  final double dx;
  final double dy;
  final double horizonPadding;

  const MovePiece({
    required this.index,
    required this.dx,
    required this.dy,
    required this.horizonPadding,
  });
}

class StartTimer implements PuzzleAction {
  const StartTimer();
}

class Reset implements PuzzleAction {
  const Reset();
}
