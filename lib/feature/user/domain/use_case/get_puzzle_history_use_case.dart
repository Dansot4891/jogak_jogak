import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';

class GetPuzzleHistoryUseCase {
  final UserRepository _userRepository;

  GetPuzzleHistoryUseCase(this._userRepository);

  Future<Result<List<PuzzleHistory>>> execute() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return const Result.error(UserNotFoundException());
      }
      final puzzleHistory = await _userRepository.getPuzzleHistory(user.uid);
      return Result.success(puzzleHistory);
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
