import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';
import 'package:jogak_jogak/feature/auth/data/data_source/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    final uid = await _dataSource.signIn(email: email, password: password);
    return uid;
  }

  @override
  Future<void> signOut() async {
    return await _dataSource.signOut();
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    return await _dataSource.signUp(
      email: email,
      password: password,
      username: username,
    );
  }

  @override
  Future<void> changePassword(String email) async {
    return await _dataSource.changePassword(email);
  }

  @override
  Future<void> deleteUser({
    required String email,
    required String password,
  }) async {
    return await _dataSource.deleteUser(email: email, password: password);
  }
}
