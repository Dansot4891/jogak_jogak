import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';

class PuzzleHistoryState {
  final List<PuzzleHistory> history;
  final BaseState state;
  final String errorMessage;

  const PuzzleHistoryState({
    this.history = const [],
    this.state = BaseState.init,
    this.errorMessage = '',
  });

  PuzzleHistoryState copyWith({
    List<PuzzleHistory>? history,
    BaseState? state,
    String? errorMessage,
  }) {
    return PuzzleHistoryState(
      history: history ?? this.history,
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
