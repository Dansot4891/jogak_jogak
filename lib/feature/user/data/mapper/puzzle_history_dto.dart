import 'package:jogak_jogak/feature/user/data/dto/puzzle_history_dto.dart';
import 'package:jogak_jogak/feature/user/domain/model/puzzle_history.dart';

extension PuzzleHistoryMapper on PuzzleHistoryDto {
  PuzzleHistory toPuzzleHistory() {
    return PuzzleHistory(
      level: level ?? 0,
      playTime: playTime ?? '',
      playDate: playDate ?? DateTime.now(),
    );
  }
}
