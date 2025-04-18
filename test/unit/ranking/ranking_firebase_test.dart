import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/mock/mock_ranking_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';

void main() async {
  final mockData = const RankingDto(
    nickname: '임명우',
    level: 3,
    email: 'test@gmail.com',
    playTime: '3:20',
    rank: 3,
  );
  final instance = FakeFirebaseFirestore();

  test('ranking data source test', () async {
    await instance.collection('ranking').add(mockData.toJson());
    final snapshot = await instance.collection('ranking').get();
    final firebaseData =
        snapshot.docs.map((e) => RankingDto.fromJson(e.data())).toList();

    final mockDataSource = MockRankingDataSourceImpl();
    final ranking = await mockDataSource.getRankings(3);

    expect(ranking.isNotEmpty, true);
    expect(firebaseData[0].email, ranking[0].email);
    expect(firebaseData[0].nickname, ranking[0].nickname);
    expect(firebaseData[0].level, ranking[0].level);
    expect(firebaseData[0].playTime, ranking[0].playTime);
    expect(firebaseData[0].rank, ranking[0].rank);
  });
}
