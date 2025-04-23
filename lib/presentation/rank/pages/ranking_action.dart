sealed class RankingAction {
  const factory RankingAction.fetchRankings(int level, {bool isRefetching}) =
      FetchRankings;
}

class FetchRankings implements RankingAction {
  final int level;
  final bool isRefetching;
  const FetchRankings(this.level, {this.isRefetching = false});
}
