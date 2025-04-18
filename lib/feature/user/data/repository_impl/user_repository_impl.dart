import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';
import 'package:jogak_jogak/feature/user/data/data_source/user_data_source.dart';
import 'package:jogak_jogak/feature/user/data/mapper/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<void> getPuzzleHistory(String email) {
    // TODO: implement getPuzzleHistory
    throw UnimplementedError();
  }

  @override
  Future<AppUser> getUser(String uid) async {
    final userDto = await _dataSource.getUser(uid);
    return userDto.toUser();
  }
}
