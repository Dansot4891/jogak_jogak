import 'package:jogak_jogak/core/helper/extension/list_map_extension.dart';
import 'package:jogak_jogak/feature/user/data/mapper/puzzle_history_dto.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';
import 'package:jogak_jogak/feature/user/data/data_source/user_data_source.dart';
import 'package:jogak_jogak/feature/user/data/mapper/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<PuzzleHistory>> getPuzzleHistory(String uid) async {
    final puzzleHistoryDto = await _dataSource.getPuzzleHistory(uid);
    return puzzleHistoryDto
        .mapToEntityList((e) => e.toPuzzleHistory())
        .toList();
  }

  @override
  Future<AppUser> getUser(String uid) async {
    final userDto = await _dataSource.getUser(uid);
    return userDto.toUser();
  }

  @override
  Future<bool> checkUsername(String username) async {
    final userDto = await _dataSource.checkUsername(username);
    return userDto;
  }

  @override
  Future<void> savePuzzleHistory({
    required PuzzleHistory puzzleHistory,
    required String uid,
  }) async {
    return await _dataSource.saveGameHistory(
      puzzleHistory: puzzleHistory.toPuzzleHistoryDto(),
      uid: uid,
    );
  }

  @override
  Future<void> changeUsername({
    required String uid,
    required String username,
  }) async {
    return await _dataSource.changeUsername(uid: uid, username: username);
  }

  @override
  Future<void> withdrawal() async {
    return await _dataSource.withdrawal();
  }
}
