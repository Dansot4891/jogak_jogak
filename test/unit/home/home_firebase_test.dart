import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/mock/mock_puzzle_data_source_impl.dart';
import 'package:jogak_jogak/feature/puzzle/data/dto/puzzle_image_dto.dart';

void main() async {
  final mockData = PuzzleImageDto(
    imageUrl:
        'https://cdn.pixabay.com/photo/2021/10/13/11/44/cat-6706354_1280.jpg',
    source: 'pixabay',
  );
  final instance = FakeFirebaseFirestore();

  test('puzzle firebase & data source test', () async {
    await instance
        .collection(FirebaseCollections.puzzle)
        .add(mockData.toJson());
    final snapshot =
        await instance.collection(FirebaseCollections.puzzle).get();
    final firebaseData =
        snapshot.docs.map((e) => PuzzleImageDto.fromJson(e.data())).toList();

    final mockDataSource = MockPuzzleDataSourceImpl();
    final image = await mockDataSource.getRandomImageUrl();

    expect(firebaseData[0].imageUrl, image.imageUrl);
    expect(firebaseData[0].source, image.source);
  });
}
