import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _authRepository;
  SignOutUseCase(this._authRepository);

  Future<Result<void>> execute() async {
    try {
      final response = await _authRepository.signOut();
      return Result.success(response);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
