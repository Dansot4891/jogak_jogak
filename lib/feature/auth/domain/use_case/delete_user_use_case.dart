import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/constants/app_error_text.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';

class DeleteUserUseCase {
  final AuthRepository _authRepository;

  DeleteUserUseCase({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) : _authRepository = authRepository;

  Future<Result<void>> execute({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.deleteUser(email: email, password: password);
      return const Result.success(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == AppErrorText.invalidCredential) {
        return const Result.error(FaileSignInWithInvalidCredentialException());
      }
      return const Result.error(UnexpectedException());
    } catch (e) {
      print(e);
      return const Result.error(UnexpectedException());
    }
  }
}
