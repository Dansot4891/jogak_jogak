import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking.dart';

class RankingState {
  final List<Ranking> rankings;
  final BaseState state;
  final String errorMessage;
  const RankingState({
    this.rankings = const [],
    this.state = BaseState.init,
    this.errorMessage = '',
  });

  RankingState copyWith({
    List<Ranking>? rankings,
    BaseState? state,
    String? errorMessage,
  }) {
    return RankingState(
      rankings: rankings ?? this.rankings,
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
