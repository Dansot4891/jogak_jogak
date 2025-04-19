import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/ranking_data_source.dart';

class MockRankingDataSourceImpl implements RankingDataSource {
  @override
  Future<List<RankingDto>> getRankings(int level) async {
    return [
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 1,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 2,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 3,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 4,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 5,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 6,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 7,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 8,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 9,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 10,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 11,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 12,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 13,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 14,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 15,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 16,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 17,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 18,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 19,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: 242,
        rank: 20,
      ),
    ];
  }

  @override
  Future<void> uploadRanking(RankingDto ranking) {
    // TODO: implement uploadRanking
    throw UnimplementedError();
  }
}
