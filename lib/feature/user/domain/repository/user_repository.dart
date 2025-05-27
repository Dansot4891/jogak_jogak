import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';

abstract interface class UserRepository {
  Future<CertifiedUser> getUser(String uid);

  Future<bool> checkUsername(String username);

  Future<List<PuzzleHistory>> getPuzzleHistory(String uid);

  Future<void> savePuzzleHistory({
    required PuzzleHistory puzzleHistory,
    required String uid,
  });

  Future<void> changeUsername({required String uid, required String username});
}
