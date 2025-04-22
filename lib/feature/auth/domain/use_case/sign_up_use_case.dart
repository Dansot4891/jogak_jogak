import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);

  Future<Result<void>> execute({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final response = await _authRepository.signUp(
        email: email,
        password: password,
        username: username,
      );
      return Result.success(response);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Result.error(EmailAlreadyExistsException());
      }
      return const Result.error(UnexpectedException());
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
