import 'package:jogak_jogak/feature/ranking/data/model/ranking_model.dart';
import 'package:jogak_jogak/feature/ranking/domain/entity/ranking_entity.dart';

extension RankingMapper on RankingModel {
  RankingEntity? toEntity() {
    if (nickname == null ||
        level == null ||
        email == null ||
        playTime == null ||
        rank == null) {
      return null;
    }
    return RankingEntity(
      nickname: nickname!,
      level: level!,
      email: email!,
      playTime: playTime!,
      rank: rank!,
    );
  }
}
