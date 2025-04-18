// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:jogak_jogak/core/constants/firebase_collections.dart';
// import 'package:jogak_jogak/feature/puzzle/data/dto/puzzle_image_dto.dart';
// import 'package:jogak_jogak/feature/ranking/data/data_source/mock/mock_ranking_data_source_impl.dart';
// import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';

// void main() async {
//   final mockData = PuzzleImageDto(
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2021/10/13/11/44/cat-6706354_1280.jpg',
//     source: 'pixabay',
//   );
//   final instance = FakeFirebaseFirestore();

//   test('ranking data source test', () async {
//     await instance.collection(FirebaseCollections.puzzle).add(mockData.toJson());
//     final snapshot = await instance.collection(FirebaseCollections.puzzle).get();
//     final firebaseData =
//         snapshot.docs.map((e) => PuzzleImageDto.fromJson(e.data())).toList();

//     final mockDataSource = MockPuzzleDataSourceImpl();
//     final ranking = await mockDataSource.getRankings(3);

//     expect(ranking.isNotEmpty, true);
//     expect(firebaseData[0].email, ranking[0].email);
//     expect(firebaseData[0].nickname, ranking[0].nickname);
//     expect(firebaseData[0].level, ranking[0].level);
//     expect(firebaseData[0].playTime, ranking[0].playTime);
//     expect(firebaseData[0].rank, ranking[0].rank);
//   });
// }
