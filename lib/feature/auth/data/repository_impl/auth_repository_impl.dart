import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';
import 'package:jogak_jogak/feature/auth/data/data_source/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Result<String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dataSource.signIn(
        email: email,
        password: password,
      );
      return Result.success(response);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      return Result.success(await _dataSource.signOut());
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }

  @override
  Future<Result<void>> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      return Result.success(
        await _dataSource.signUp(
          email: email,
          password: password,
          username: username,
        ),
      );
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
