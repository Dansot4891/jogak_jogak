import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/user/data/model/user.dart';

abstract interface class UserRepository {
  Future<Result<AppUser>> getUser(String uid);

  Future<Result<AppUser>> getPuzzleHistory(String email);
}
