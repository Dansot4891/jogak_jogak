import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/feature/user/data/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/data_source.dart/user_data_source.dart';
import 'package:jogak_jogak/feature/user/domain/dto/user_dto.dart';

class UserRemoteDataSource implements UserDataSource {
  final FirebaseFirestore _store;

  UserRemoteDataSource(this._store);

  @override
  Future<List<PuzzleHistory>> getPuzzleHistory(String email) {
    // TODO: implement getPuzzleHistory
    throw UnimplementedError();
  }

  @override
  Future<UserDto> getUser(String uid) async {
    final snapshot =
        await _store.collection(FirebaseCollections.users).doc(uid).get();
    return UserDto.fromFireBase(snapshot);
  }
}
