import 'package:jogak_jogak/feature/ranking/data_source/remote/model/ranking_model.dart';
import 'package:jogak_jogak/feature/ranking/repository/entity/ranking_entity.dart';

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
