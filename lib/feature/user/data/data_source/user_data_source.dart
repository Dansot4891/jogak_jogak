import 'package:jogak_jogak/feature/user/data/dto/puzzle_history_dto.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<CertifiedUserDto> getUser(String uid);

  Future<List<PuzzleHistoryDto>> getPuzzleHistory(String uid);

  Future<void> saveGameHistory({
    required PuzzleHistoryDto puzzleHistory,
    required String uid,
  });

  Future<bool> checkUsername(String username);

  Future<void> changeUsername({required String uid, required String username});
}
