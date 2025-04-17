import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';

extension RankingMapper on RankingDto {
  Ranking? toEntity() {
    if (nickname == null ||
        level == null ||
        email == null ||
        playTime == null ||
        rank == null) {
      return null;
    }
    return Ranking(
      nickname: nickname!,
      level: level!,
      email: email!,
      playTime: playTime!,
      rank: rank!,
    );
  }
}
