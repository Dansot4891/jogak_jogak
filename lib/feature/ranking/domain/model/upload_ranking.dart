class UploadRanking {
  final String nickname;
  final int level;
  final String email;
  final int playTime;
  const UploadRanking({
    required this.nickname,
    required this.level,
    required this.email,
    required this.playTime,
  });

  UploadRanking copyWith({
    String? nickname,
    int? level,
    String? email,
    int? playTime,
  }) {
    return UploadRanking(
      nickname: nickname ?? this.nickname,
      level: level ?? this.level,
      email: email ?? this.email,
      playTime: playTime ?? this.playTime,
    );
  }

  @override
  String toString() {
    return 'UploadRanking(nickname: $nickname, level: $level, email: $email, playTime: $playTime)';
  }

  @override
  bool operator ==(covariant UploadRanking other) {
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
