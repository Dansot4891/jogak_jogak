import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/with_level_ranking.dart';

class RankingState {
  final List<WithLevelRanking> withLevelRanking;
  final BaseState state;
  final String errorMessage;
  const RankingState({
    required this.withLevelRanking,
    this.state = BaseState.init,
    this.errorMessage = '',
  });

  RankingState copyWith({
    List<WithLevelRanking>? withLevelRanking,
    BaseState? state,
    String? errorMessage,
  }) {
    return RankingState(
      withLevelRanking: withLevelRanking ?? this.withLevelRanking,
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
