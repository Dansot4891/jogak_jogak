import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserCredential> signInWithGoogle();

  Future<void> signOut();

  Future<void> signUp();
}
