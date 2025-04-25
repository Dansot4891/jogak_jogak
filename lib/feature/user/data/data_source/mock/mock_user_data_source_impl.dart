import 'package:jogak_jogak/feature/user/data/data_source/user_data_source.dart';
import 'package:jogak_jogak/feature/user/data/dto/puzzle_history_dto.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';

class MockRankingDataSourceImpl implements UserDataSource {
  final userList = [
    UserDto(username: 'username1', email: 'email1'),
    UserDto(username: 'username2', email: 'email2'),
    UserDto(username: 'username3', email: 'email3'),
  ];

  final historyList = [
    PuzzleHistoryDto(level: 3, playTime: 132, playDate: DateTime.now()),
    PuzzleHistoryDto(level: 3, playTime: 135, playDate: DateTime.now()),
    PuzzleHistoryDto(level: 4, playTime: 162, playDate: DateTime.now()),
    PuzzleHistoryDto(level: 4, playTime: 177, playDate: DateTime.now()),
    PuzzleHistoryDto(level: 5, playTime: 209, playDate: DateTime.now()),
  ];
  @override
  Future<void> changeUsername({required String uid, required String username}) {
    // TODO: implement changeUsername
    throw UnimplementedError();
  }

  @override
  Future<bool> checkUsername(String username) async {
    return userList.where((e) => e.username == username).isEmpty;
  }

  @override
  Future<List<PuzzleHistoryDto>> getPuzzleHistory(String uid) async {
    return historyList;
  }

  @override
  Future<UserDto> getUser(String uid) async {
    return userList[0];
  }

  @override
  Future<void> saveGameHistory({
    required PuzzleHistoryDto puzzleHistory,
    required String uid,
  }) {
    // TODO: implement saveGameHistory
    throw UnimplementedError();
  }

  @override
  Future<void> withdrawal() {
    // TODO: implement withdrawal
    throw UnimplementedError();
  }
}
