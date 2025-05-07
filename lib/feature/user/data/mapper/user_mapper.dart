import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';

extension UserMapper on CertifiedUserDto {
  CertifiedUser toUser() {
    return CertifiedUser(username: username ?? '', email: email ?? '');
  }
}
