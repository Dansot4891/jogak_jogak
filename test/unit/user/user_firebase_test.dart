import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/feature/user/data/data_source/mock/mock_user_data_source_impl.dart';
import 'package:jogak_jogak/feature/user/data/dto/puzzle_history_dto.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';

void main() async {
  final userMockData = CertifiedUserDto(
    email: 'test@gmail.com',
    username: 'username',
  );
  final historyMockData = PuzzleHistoryDto(
    level: 3,
    playTime: 132,
    playDate: DateTime.now(),
  );
  final instance = FakeFirebaseFirestore();

  group('user firebase & data source test', () {
    test('getUser test', () async {
      await instance
          .collection(FirebaseCollections.users)
          .add(userMockData.toJson());
      final snapshot =
          await instance.collection(FirebaseCollections.users).get();
      final firebaseData =
          snapshot.docs
              .map((e) => CertifiedUserDto.fromJson(e.data()))
              .toList();

      final mockDataSource = MockUserDataSourceImpl();
      final user = await mockDataSource.getUser('');

      expect(firebaseData[0].email, user.email);
      expect(firebaseData[0].username, user.username);
    });

    test('getPuzzleHistory test', () async {
      await instance
          .collection(FirebaseCollections.puzzleHistory)
          .add(historyMockData.toJson());
      final snapshot =
          await instance.collection(FirebaseCollections.puzzleHistory).get();
      final firebaseData =
          snapshot.docs
              .map((e) => PuzzleHistoryDto.fromJson(e.data()))
              .toList();

      final mockDataSource = MockUserDataSourceImpl();
      final history = await mockDataSource.getPuzzleHistory('');

      expect(firebaseData[0].level, history[0].level);
      expect(firebaseData[0].playTime, history[0].playTime);
    });
  });
}
