import 'package:jogak_jogak/feature/user/data/dto/puzzle_history_dto.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<UserDto> getUser(String uid);

  Future<List<PuzzleHistory>> getPuzzleHistory(String email);

  Future<void> saveGameHistory(PuzzleHistoryDto puzzleHistory);

  Future<bool> checkUsername(String username);
}
