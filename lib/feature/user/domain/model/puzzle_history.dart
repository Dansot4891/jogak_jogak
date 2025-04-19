class PuzzleHistory {
  final int level;
  final String playTime;
  final DateTime playDate;

  const PuzzleHistory({
    required this.level,
    required this.playTime,
    required this.playDate,
  });

  PuzzleHistory copyWith({int? level, String? playTime, DateTime? playDate}) {
    return PuzzleHistory(
      level: level ?? this.level,
      playTime: playTime ?? this.playTime,
      playDate: playDate ?? this.playDate,
    );
  }

  @override
  String toString() =>
      'PuzzleHistory(level: $level, playTime: $playTime, playDate: $playDate)';

  @override
  bool operator ==(covariant PuzzleHistory other) {
    if (identical(this, other)) return true;

    return other.level == level &&
        other.playTime == playTime &&
        other.playDate == playDate;
  }

  @override
  int get hashCode => level.hashCode ^ playTime.hashCode ^ playDate.hashCode;
}
