import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';

class DeleteUserUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  DeleteUserUseCase({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) : _authRepository = authRepository,
       _userRepository = userRepository;

  Future<Result<void>> execute({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.deleteUser(email: email, password: password);
      await _userRepository.withdrawal();
      return const Result.success(null);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
