import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';

class WithLevelRanking {
  final List<Ranking> rankings;
  final int level;

  const WithLevelRanking({this.rankings = const [], required this.level});

  @override
  String toString() => 'WithLevelRanking(rankings: $rankings, level: $level)';

  @override
  bool operator ==(covariant WithLevelRanking other) {
    if (identical(this, other)) return true;

    return listEquals(other.rankings, rankings) && other.level == level;
  }

  @override
  int get hashCode => rankings.hashCode ^ level.hashCode;

  WithLevelRanking copyWith({List<Ranking>? rankings, int? level}) {
    return WithLevelRanking(
      rankings: rankings ?? this.rankings,
      level: level ?? this.level,
    );
  }
}
