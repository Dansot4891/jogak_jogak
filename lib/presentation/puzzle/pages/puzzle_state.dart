import 'dart:io';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle.dart';

class PuzzleState {
  final File? file;
  // 사용자가 가진 퍼즐
  final List<Puzzle> pieces;
  // 정답 퍼즐
  final List<Puzzle> correctPieces;
  final int gridViewSize;
  // 경과 시간
  final int elapsedSeconds;
  final bool gameOver;
  final bool isCertified;

  const PuzzleState({
    this.file,
    this.pieces = const [],
    this.gridViewSize = 3,
    this.correctPieces = const [],
    this.elapsedSeconds = 0,
    this.gameOver = false,
    this.isCertified = false,
  });

  PuzzleState copyWith({
    File? file,
    List<Puzzle>? pieces,
    List<Puzzle>? correctPieces,
    int? gridViewSize,
    int? elapsedSeconds,
    bool? gameOver,
    bool? isCertified,
  }) {
    return PuzzleState(
      file: file ?? this.file,
      pieces: pieces ?? this.pieces,
      correctPieces: correctPieces ?? this.correctPieces,
      gridViewSize: gridViewSize ?? this.gridViewSize,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      gameOver: gameOver ?? this.gameOver,
      isCertified: isCertified ?? this.isCertified,
    );
  }
}
