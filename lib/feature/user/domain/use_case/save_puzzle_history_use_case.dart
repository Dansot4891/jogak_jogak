import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';

class SavePuzzleHistoryUseCase {
  final UserRepository _userRepository;

  SavePuzzleHistoryUseCase(this._userRepository);

  Future<Result<void>> execute(PuzzleHistory puzzleHistory) async {
    try {
      final authUser = FirebaseAuth.instance.currentUser;
      if (authUser == null) {
        return const Result.error(UserNotFoundException());
      }
      return Result.success(
        await _userRepository.savePuzzleHistory(
          puzzleHistory: puzzleHistory,
          uid: authUser.uid,
        ),
      );
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
