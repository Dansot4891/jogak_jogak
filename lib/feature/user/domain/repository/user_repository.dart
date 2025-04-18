import 'package:jogak_jogak/feature/user/domain/model/user.dart';

abstract interface class UserRepository {
  Future<AppUser> getUser(String uid);

  Future<void> getPuzzleHistory(String email);

  Future<bool> checkUsername(String username);
}
