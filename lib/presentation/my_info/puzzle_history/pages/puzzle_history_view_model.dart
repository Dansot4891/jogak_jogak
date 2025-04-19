import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/get_puzzle_history_use_case.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_state.dart';

class PuzzleHistoryViewModel with ChangeNotifier {
  final GetPuzzleHistoryUseCase _getPuzzleHistoryUseCase;

  PuzzleHistoryViewModel(this._getPuzzleHistoryUseCase);

  PuzzleHistoryState _state = const PuzzleHistoryState();
  PuzzleHistoryState get state => _state;

  void getPuzzleHistory() async {
    final result = await _getPuzzleHistoryUseCase.execute();
    switch (result) {
      case Success<List<PuzzleHistory>>():
        print(result.data);
        _state = state.copyWith(history: result.data, state: BaseState.success);
      case Error<List<PuzzleHistory>>():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: result.error.message,
        );
    }
    notifyListeners();
  }
}
