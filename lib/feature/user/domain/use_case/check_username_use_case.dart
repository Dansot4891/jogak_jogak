import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';

class CheckUsernameUseCase {
  final UserRepository _userRepository;

  CheckUsernameUseCase(this._userRepository);

  Future<Result<bool>> execute(String username) async {
    try {
      final value = await _userRepository.checkUsername(username);
      return Result.success(value);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
