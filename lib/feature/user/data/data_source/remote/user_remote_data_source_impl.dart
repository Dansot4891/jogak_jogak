import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/data/data_source/user_data_source.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';

class UserRemoteDataSourceImpl implements UserDataSource {
  final FirebaseFirestore _store;

  UserRemoteDataSourceImpl(this._store);

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

  @override
  Future<bool> checkUsername(String username) async {
    final snapshot =
        await _store
            .collection(FirebaseCollections.users)
            .where('username', isEqualTo: username)
            .get();
    // 해당 닉네임이 사용가능하면 true
    // 해당 닉네임이 사용 불가능하면 false
    return snapshot.docs.isEmpty;
  }
}
