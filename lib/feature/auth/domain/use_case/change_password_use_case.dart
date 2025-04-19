import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository _authRepository;

  ChangePasswordUseCase(this._authRepository);

  Future<Result<void>> execute(String email) async {
    try {
      return Result.success(_authRepository.changePassword(email));
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
