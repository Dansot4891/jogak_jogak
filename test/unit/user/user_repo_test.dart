import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/data/data_source/mock/mock_user_data_source_impl.dart';
import 'package:jogak_jogak/feature/user/data/dto/puzzle_history_dto.dart';
import 'package:jogak_jogak/feature/user/data/dto/user_dto.dart';
import 'package:jogak_jogak/feature/user/data/mapper/user_mapper.dart';
import 'package:jogak_jogak/feature/user/data/repository_impl/user_repository_impl.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/get_puzzle_history_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/get_user_use_case.dart';

void main() {
  group('user repo test', () {
    final userMock = [
      UserDto(email: 'test@gmail.com', username: 'username'),
      UserDto(username: 'username2', email: 'email2'),
      UserDto(username: 'username3', email: 'email3'),
    ];
    final historyMock = [
      PuzzleHistoryDto(level: 3, playTime: 132, playDate: DateTime.now()),
      PuzzleHistoryDto(level: 3, playTime: 135, playDate: DateTime.now()),
      PuzzleHistoryDto(level: 4, playTime: 162, playDate: DateTime.now()),
      PuzzleHistoryDto(level: 4, playTime: 177, playDate: DateTime.now()),
      PuzzleHistoryDto(level: 5, playTime: 209, playDate: DateTime.now()),
    ];
    final GetUserUseCase userUsecase = GetUserUseCase(
      UserRepositoryImpl(MockUserDataSourceImpl()),
    );
    final GetPuzzleHistoryUseCase historyUsecase = GetPuzzleHistoryUseCase(
      UserRepositoryImpl(MockUserDataSourceImpl()),
    );
    test('user getuser repo test', () async {
      final userResult = await userUsecase.execute('');

      switch (userResult) {
        case Success<AppUser>():
          expect(userResult.data, equals(userMock[0].toUser()));
        case Error<AppUser>():
          expect(userResult.error, const UnexpectedException());
      }
    });

    test('user gethistory repo test', () async {
      final historyResult = await historyUsecase.execute();

      switch (historyResult) {
        case Success<List<PuzzleHistory>>():
          expect(historyResult.data[0].level, equals(historyMock[0].level));
          expect(
            historyResult.data[0].playTime,
            equals(historyMock[0].playTime),
          );
        case Error<List<PuzzleHistory>>():
          expect(historyResult.error, const UnexpectedException());
      }
    });
  });
}
