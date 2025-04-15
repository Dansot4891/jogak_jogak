import 'package:jogak_jogak/feature/user/data/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/dto/user_dto.dart';

extension UserMapper on UserDto {
  AppUser toUser() {
    return AppUser(username: username ?? '', email: email ?? '');
  }
}
