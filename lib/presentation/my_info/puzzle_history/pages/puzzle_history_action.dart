sealed class PuzzleHistoryAction {
  const factory PuzzleHistoryAction.getPuzzleHistory() = GetPuzzleHistory;
}

class GetPuzzleHistory implements PuzzleHistoryAction {
  const GetPuzzleHistory();
}
