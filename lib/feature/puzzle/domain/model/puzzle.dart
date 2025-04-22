import 'dart:io';

class Puzzle {
  final int index;
  final File file;
  final bool isRight;
  final double top;
  final double left;

  const Puzzle({
    required this.index,
    required this.file,
    required this.top,
    required this.left,
    this.isRight = false,
  });

  Puzzle copyWith({
    int? index,
    File? file,
    bool? isRight,
    double? top,
    double? left,
  }) {
    return Puzzle(
      index: index ?? this.index,
      file: file ?? this.file,
      isRight: isRight ?? this.isRight,
      top: top ?? this.top,
      left: left ?? this.left,
    );
  }

  @override
  bool operator ==(covariant Puzzle other) {
    if (identical(this, other)) return true;

    return other.index == index && other.file == file;
  }

  @override
  int get hashCode {
    return index.hashCode ^ file.hashCode;
  }

  @override
  String toString() {
    return 'Puzzle(index: $index, file: $file, isRight: $isRight, top: $top, left: $left)';
  }
}
