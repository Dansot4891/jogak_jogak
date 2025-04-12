import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserCredential> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String username,
  });
}
