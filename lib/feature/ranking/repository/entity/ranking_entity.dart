class RankingEntity {
  final String nickname;
  final int level;
  final String email;
  final String playTime;
  final int rank;
  const RankingEntity({
    required this.nickname,
    required this.level,
    required this.email,
    required this.playTime,
    required this.rank,
  });

  RankingEntity copyWith({
    String? nickname,
    int? level,
    String? email,
    String? playTime,
    int? rank,
  }) {
    return RankingEntity(
      nickname: nickname ?? this.nickname,
      level: level ?? this.level,
      email: email ?? this.email,
      playTime: playTime ?? this.playTime,
      rank: rank ?? this.rank,
    );
  }

  @override
  String toString() {
    return 'RankingEntity(nickname: $nickname, level: $level, email: $email, playTime: $playTime, rank: $rank)';
  }

  @override
  bool operator ==(covariant RankingEntity other) {
    if (identical(this, other)) return true;

    return other.nickname == nickname &&
        other.level == level &&
        other.email == email &&
        other.playTime == playTime &&
        other.rank == rank;
  }

  @override
  int get hashCode {
    return nickname.hashCode ^
        level.hashCode ^
        email.hashCode ^
        playTime.hashCode ^
        rank.hashCode;
  }
}
