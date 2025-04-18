import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);

  Future<Result<String>> execute({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authRepository.signIn(
        email: email,
        password: password,
      );
      return Result.success(response);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
