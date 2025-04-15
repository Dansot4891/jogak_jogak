import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/auth/data/repository/auth_repository.dart';
import 'package:jogak_jogak/feature/auth/domain/data_source/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Result<UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dataSource.signIn(
        email: email,
        password: password,
      );
    } catch (e) {}
  }

  @override
  Future<Result<void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signUp({
    required String email,
    required String password,
    required String username,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
