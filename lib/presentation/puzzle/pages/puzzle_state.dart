// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:jogak_jogak/feature/puzzle/data/model/puzzle.dart';

class PuzzleState {
  final File? file;
  // 사용자가 가진 퍼즐
  final List<Puzzle> pieces;
  // 정답 퍼즐
  final List<Puzzle> correctPieces;
  final int gridViewSize;

  const PuzzleState({
    this.file,
    this.pieces = const [],
    this.gridViewSize = 3,
    this.correctPieces = const [],
  });

  PuzzleState copyWith({
    File? file,
    List<Puzzle>? pieces,
    List<Puzzle>? correctPieces,
    int? gridViewSize,
  }) {
    return PuzzleState(
      file: file ?? this.file,
      pieces: pieces ?? this.pieces,
      correctPieces: correctPieces ?? this.correctPieces,
      gridViewSize: gridViewSize ?? this.gridViewSize,
    );
  }
}
