class PuzzleHistory {
  final int level;
  final String playTime;
  final DateTime endTime;

  const PuzzleHistory({
    required this.level,
    required this.playTime,
    required this.endTime,
  });

  PuzzleHistory copyWith({int? level, String? playTime, DateTime? endTime}) {
    return PuzzleHistory(
      level: level ?? this.level,
      playTime: playTime ?? this.playTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  String toString() =>
      'PuzzleHistory(level: $level, playTime: $playTime, endTime: $endTime)';

  @override
  bool operator ==(covariant PuzzleHistory other) {
    if (identical(this, other)) return true;

    return other.level == level &&
        other.playTime == playTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode => level.hashCode ^ playTime.hashCode ^ endTime.hashCode;
}
