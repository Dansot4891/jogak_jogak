import 'package:jogak_jogak/feature/user/data/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<UserDto> getUser(String uid);

  Future<List<PuzzleHistory>> getPuzzleHistory(String email);
}
