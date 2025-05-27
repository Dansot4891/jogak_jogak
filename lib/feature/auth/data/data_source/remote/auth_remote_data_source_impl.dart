import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';
import 'package:jogak_jogak/feature/auth/data/data_source/remote/auth_remote_data_source.dart';

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
    final id = userCredential.user?.uid;

    // uid가 존재하지 않는다면 에러
    if (id == null) {
      throw const UIDNotFoundException();
    }

    // 유저의 닉네임을 store에 저장
    // 유저의 uid값을 문서 id로 설정
    final user = CertifiedUserDto(username: username, email: email);
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

  @override
  Future<void> changePassword(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> deleteUser({
    required String email,
    required String password,
  }) async {
    final user = _auth.currentUser!;
    final uid = user.uid;

    // 1) 재인증
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await user.reauthenticateWithCredential(cred);

    // 2) Firestore 문서 삭제 (먼저)
    await _store.collection(FirebaseCollections.users).doc(uid).delete();

    // 3) Auth 계정 삭제
    await user.delete();
  }
}
