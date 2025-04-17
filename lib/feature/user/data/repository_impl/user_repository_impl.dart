import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';
import 'package:jogak_jogak/feature/user/data/data_source/user_data_source.dart';
import 'package:jogak_jogak/feature/user/data/mapper/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<Result<AppUser>> getPuzzleHistory(String email) {
    // TODO: implement getPuzzleHistory
    throw UnimplementedError();
  }

  @override
  Future<Result<AppUser>> getUser(String uid) async {
    try {
      final userDto = await _dataSource.getUser(uid);
      return Result.success(userDto.toUser());
    } catch (e) {
      return const Result.error(UnexpectedException());
    }
  }
}
