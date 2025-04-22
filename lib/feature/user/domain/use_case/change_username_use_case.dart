import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';

class ChangeUsernameUseCase {
  final UserRepository _userRepository;

  ChangeUsernameUseCase(this._userRepository);

  Future<Result<void>> execute(String username) async {
    try {
      final authUser = FirebaseAuth.instance.currentUser;
      if (authUser == null) {
        return const Result.error(UserNotFoundException());
      }
      return Result.success(
        await _userRepository.changeUsername(
          uid: authUser.uid,
          username: username,
        ),
      );
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
