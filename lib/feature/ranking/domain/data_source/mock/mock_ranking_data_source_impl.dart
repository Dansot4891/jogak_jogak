import 'package:jogak_jogak/feature/ranking/domain/dto/ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/domain/data_source/remote/ranking_remote_data_source.dart';

class MockRankingDataSourceImpl implements RankingRemoteDataSource {
  @override
  Future<List<RankingDto>> getRankings() async {
    return [
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 1,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 2,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 3,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 4,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 5,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 6,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 7,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 8,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 9,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 10,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 11,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 12,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 13,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 14,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 15,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 16,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 17,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 18,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 19,
      ),
      const RankingDto(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 20,
      ),
    ];
  }
}
