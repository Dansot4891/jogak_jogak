import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<UserDto> getUser(String uid);

  Future<List<PuzzleHistory>> getPuzzleHistory(String email);

  Future<bool> checkUsername(String username);
}
