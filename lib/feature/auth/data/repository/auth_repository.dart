import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';

abstract interface class AuthRepository {
  Future<Result<void>> signOut();

  Future<Result<void>> signUp({
    required String email,
    required String password,
    required String username,
  });

  Future<Result<UserCredential>> signIn({
    required String email,
    required String password,
  });
}
