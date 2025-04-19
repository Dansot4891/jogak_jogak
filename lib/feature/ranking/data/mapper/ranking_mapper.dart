import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';

extension RankingMapper on RankingDto {
  Ranking? toRanking() {
    if (nickname == null ||
        level == null ||
        email == null ||
        playTime == null) {
      return null;
    }
    return Ranking(
      nickname: nickname!,
      level: level!,
      email: email!,
      playTime: playTime!,
    );
  }
}

extension RankingDtoMapper on Ranking {
  RankingDto toRankingDto() {
    return RankingDto(
      nickname: nickname,
      level: level,
      email: email,
      playTime: playTime,
    );
  }
}
