import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';

class WithdrawalUseCase {
  final UserRepository _userRepository;

  WithdrawalUseCase(this._userRepository);

  Future<Result<void>> execute() async {
    try {
      return Result.success(await _userRepository.withdrawal());
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
