import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';

class PuzzleHistoryState {
  final List<PuzzleHistory> history;
  final BaseState state;

  const PuzzleHistoryState({
    this.history = const [],
    this.state = BaseState.init,
  });

  PuzzleHistoryState copyWith({
    List<PuzzleHistory>? history,
    BaseState? state,
  }) {
    return PuzzleHistoryState(
      history: history ?? this.history,
      state: state ?? this.state,
    );
  }
}
