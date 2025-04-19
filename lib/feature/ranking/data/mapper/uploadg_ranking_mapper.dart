import 'package:jogak_jogak/feature/ranking/data/dto/upload_ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/upload_ranking.dart';

extension RankingMapper on UploadRanking {
  UploadRankingDto toUploadRankingDto() {
    return UploadRankingDto(
      nickname: nickname,
      level: level,
      email: email,
      playTime: playTime,
    );
  }
}
