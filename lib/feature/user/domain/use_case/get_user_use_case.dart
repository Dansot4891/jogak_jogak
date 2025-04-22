import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  Future<Result<AppUser>> execute(String uid) async {
    try {
      final user = await _userRepository.getUser(uid);
      return Result.success(user);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
