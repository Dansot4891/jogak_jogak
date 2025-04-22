sealed class RankingAction {
  const factory RankingAction.fetchRankings(int level) = FetchRankings;
}

class FetchRankings implements RankingAction {
  final int level;
  const FetchRankings(this.level);
}
