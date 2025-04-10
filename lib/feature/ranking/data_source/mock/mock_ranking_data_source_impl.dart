import 'package:jogak_jogak/feature/ranking/data_source/remote/model/ranking_model.dart';
import 'package:jogak_jogak/feature/ranking/data_source/remote/ranking_remote_data_source.dart';

class MockRankingDataSourceImpl implements RankingRemoteDataSource {
  @override
  Future<List<RankingModel>> getRankings() async {
    return [
      RankingModel(
        nickname: '임명우',
        level: 3,
        email: 'test@gmail.com',
        playTime: '3:20',
        rank: 3,
      ),
    ];
  }
}
