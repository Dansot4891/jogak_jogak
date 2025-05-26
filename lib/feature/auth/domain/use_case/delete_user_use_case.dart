import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';

class DeleteUserUseCase {
  final AuthRepository _authRepository;

  DeleteUserUseCase(this._authRepository);

  Future<Result<void>> execute({
    required String email,
    required String password,
  }) async {
    try {
      return Result.success(
        _authRepository.deleteUser(email: email, password: password),
      );
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
