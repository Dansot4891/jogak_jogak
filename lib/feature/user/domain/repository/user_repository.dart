import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';

abstract interface class UserRepository {
  Future<AppUser> getUser(String uid);

  Future<List<PuzzleHistory>> getPuzzleHistory(String uid);

  Future<bool> checkUsername(String username);
}
