import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/auth/domain/dto/user_dto.dart';
import 'package:jogak_jogak/feature/auth/domain/data_source/remote/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  @override
  Future<void> signOut() async {
    return _auth.signOut();
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // 회원가입시 유저가 작성한 닉네임을 프로필에 업데이트
    await userCredential.user?.updateDisplayName(username);
    final id = userCredential.user?.uid;

    // uid가 존재하지 않는다면 에러
    if (id == null) {
      throw const UIDNotFoundException();
    }

    // 유저의 닉네임을 store에 저장
    // 유저의 uid값을 문서 id로 설정
    final user = UserDto(username: username, email: email);
    await _store
        .collection(FirebaseCollections.users)
        .doc(id)
        .set(user.toJson());
  }

  @override
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user == null) {
      throw const UserNotFoundException();
    }
    return userCredential.user!.uid;
  }
}
