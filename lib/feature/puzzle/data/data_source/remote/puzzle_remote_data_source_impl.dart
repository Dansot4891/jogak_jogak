import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/core/module/random/random_generator.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/puzzle_data_source.dart';
import 'package:jogak_jogak/feature/puzzle/data/dto/puzzle_image_dto.dart';

class PuzzleRemoteDataSourceImpl implements PuzzleDataSource {
  final FirebaseFirestore _instance;
  final RandomGenerator _generator = RandomGenerator();

  PuzzleRemoteDataSourceImpl(this._instance);

  @override
  Future<PuzzleImageDto> getRandomImageUrl() async {
    // 파이어베이스에서 현재 스토어에 저장된 퍼즐의 개수 가져오기
    final querySnapshot =
        await _instance.collection(FirebaseCollections.puzzle).count().get();
    final count = querySnapshot.count;
    if (querySnapshot.count == null) {
      throw const FailedToFetchImageException();
    }
    // 1부터 길이까지의 랜덤값 추출
    final id = _generator.nextInt(count!, seed: 1);
    final snapshot =
        await _instance
            .collection(FirebaseCollections.puzzle)
            .doc(id.toString())
            .get();
    return PuzzleImageDto.fromFireBase(snapshot);
  }

  @override
  Future<void> savePuzzleResult() {
    // TODO: implement savePuzzleResult
    throw UnimplementedError();
  }
}
