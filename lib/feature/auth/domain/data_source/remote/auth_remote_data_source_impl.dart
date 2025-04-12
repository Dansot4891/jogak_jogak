import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/feature/auth/domain/data_source/remote/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  @override
  Future<void> signOut() async {
    return _auth.signOut();
  }

  @override
  Future<UserCredential> signUp({
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

    return userCredential;
  }

  @override
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }
}
