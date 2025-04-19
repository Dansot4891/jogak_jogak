class Ranking {
  final String nickname;
  final int level;
  final String email;
  final int playTime;
  const Ranking({
    required this.nickname,
    required this.level,
    required this.email,
    required this.playTime,
  });

  Ranking copyWith({
    String? nickname,
    int? level,
    String? email,
    int? playTime,
  }) {
    return Ranking(
      nickname: nickname ?? this.nickname,
      level: level ?? this.level,
      email: email ?? this.email,
      playTime: playTime ?? this.playTime,
    );
  }

  @override
  String toString() {
    return 'Ranking(nickname: $nickname, level: $level, email: $email, playTime: $playTime)';
  }

  @override
  bool operator ==(covariant Ranking other) {
    if (identical(this, other)) return true;

    return other.nickname == nickname &&
        other.level == level &&
        other.email == email &&
        other.playTime == playTime;
  }

  @override
  int get hashCode {
    return nickname.hashCode ^
        level.hashCode ^
        email.hashCode ^
        playTime.hashCode;
  }
}
