import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/user/data/dto/puzzle_history_dto.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/get_puzzle_history_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/get_user_use_case.dart';

void main() {
  group('user repo test', () {
    diSetup();
    final userMock = [const AppUser(username: 'username', email: 'email')];
    final historyMock = [
      PuzzleHistoryDto(level: 3, playTime: 132, playDate: DateTime.now()),
    ];
    final GetUserUseCase userUsecase = locator();
    final GetPuzzleHistoryUseCase historyUsecase = locator();
    test('user getuser repo test', () async {
      final userResult = await userUsecase.execute('');

      switch (userResult) {
        case Success<AppUser>():
          expect(userResult.data, equals(userMock[0]));
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
