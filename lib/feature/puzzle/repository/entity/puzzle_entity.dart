import 'dart:io';

class PuzzleEntity {
  final int index;
  final File file;
  final bool isRight;
  final double top;
  final double left;

  const PuzzleEntity({
    required this.index,
    required this.file,
    required this.top,
    required this.left,
    this.isRight = false,
  });

  PuzzleEntity copyWith({
    int? index,
    File? file,
    bool? isRight,
    double? top,
    double? left,
  }) {
    return PuzzleEntity(
      index: index ?? this.index,
      file: file ?? this.file,
      isRight: isRight ?? this.isRight,
      top: top ?? this.top,
      left: left ?? this.left,
    );
  }

  @override
  bool operator ==(covariant PuzzleEntity other) {
    if (identical(this, other)) return true;

    return other.index == index && other.file == file;
  }

  @override
  int get hashCode {
    return index.hashCode ^ file.hashCode;
  }

  @override
  String toString() {
    return 'PuzzleEntity(index: $index, file: $file, isRight: $isRight, top: $top, left: $left)';
  }
}
