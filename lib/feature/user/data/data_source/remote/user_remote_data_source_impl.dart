import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/core/constants/firebase_query.dart';
import 'package:jogak_jogak/feature/user/data/dto/puzzle_history_dto.dart';
import 'package:jogak_jogak/feature/user/data/data_source/user_data_source.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';

class UserRemoteDataSourceImpl implements UserDataSource {
  final FirebaseFirestore _store;

  UserRemoteDataSourceImpl(this._store);

  @override
  Future<List<PuzzleHistoryDto>> getPuzzleHistory(String uid) async {
    final snapshot =
        await _store
            .collection(FirebaseCollections.users)
            .doc(uid)
            .collection(FirebaseCollections.puzzleHistory)
            .get();
    final puzzleHistory =
        snapshot.docs.map((e) => PuzzleHistoryDto.fromFireBase(e)).toList();
    return puzzleHistory;
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

  @override
  Future<void> saveGameHistory({
    required PuzzleHistoryDto puzzleHistory,
    required String uid,
  }) async {
    await _store
        .collection(FirebaseCollections.users)
        .doc(uid)
        .collection(FirebaseCollections.puzzleHistory)
        .add(puzzleHistory.toJson());
  }

  @override
  Future<void> changeUsername({
    required String uid,
    required String username,
  }) async {
    await _store.collection(FirebaseCollections.users).doc(uid).update({
      FirebaseQuery.username: username,
    });
  }

  @override
  Future<void> withdrawal() async {
    final user = FirebaseAuth.instance.currentUser;
    await user!.delete();
    await _store.collection(FirebaseCollections.users).doc(user.uid).delete();
  }
}
