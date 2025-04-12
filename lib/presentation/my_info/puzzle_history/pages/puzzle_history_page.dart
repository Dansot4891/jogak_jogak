import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/helper/date_time_extension.dart';
import 'package:jogak_jogak/feature/user/data/model/puzzle_history.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/widgets/history_card.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/widgets/history_header.dart';

final List<PuzzleHistory> list = [
  PuzzleHistory(level: 3, playTime: '3:01', endTime: DateTime(2025, 04, 13)),
  PuzzleHistory(level: 4, playTime: '3:01', endTime: DateTime(2025, 04, 13)),
  PuzzleHistory(level: 3, playTime: '3:02', endTime: DateTime(2025, 04, 13)),
  PuzzleHistory(level: 3, playTime: '3:04', endTime: DateTime(2025, 04, 12)),
  PuzzleHistory(level: 4, playTime: '3:01', endTime: DateTime(2025, 04, 11)),
  PuzzleHistory(level: 5, playTime: '3:01', endTime: DateTime(2025, 04, 11)),
  PuzzleHistory(level: 3, playTime: '3:01', endTime: DateTime(2025, 04, 10)),
  PuzzleHistory(level: 4, playTime: '3:01', endTime: DateTime(2025, 04, 9)),
  PuzzleHistory(level: 3, playTime: '3:01', endTime: DateTime(2025, 04, 8)),
  PuzzleHistory(level: 5, playTime: '3:01', endTime: DateTime(2025, 03, 13)),
  PuzzleHistory(level: 5, playTime: '3:01', endTime: DateTime(2025, 03, 7)),
  PuzzleHistory(level: 5, playTime: '3:01', endTime: DateTime(2025, 03, 1)),
  PuzzleHistory(level: 5, playTime: '3:01', endTime: DateTime(2025, 02, 25)),
  PuzzleHistory(level: 3, playTime: '3:01', endTime: DateTime(2024, 02, 13)),
  PuzzleHistory(level: 3, playTime: '3:01', endTime: DateTime(2024, 01, 13)),
  PuzzleHistory(level: 4, playTime: '3:01', endTime: DateTime(2024, 04, 13)),
  PuzzleHistory(level: 5, playTime: '3:01', endTime: DateTime(2023, 03, 13)),
  PuzzleHistory(level: 3, playTime: '3:01', endTime: DateTime(2023, 02, 13)),
  PuzzleHistory(level: 3, playTime: '3:01', endTime: DateTime(2023, 01, 13)),
];

class PuzzleHistoryPage extends StatelessWidget {
  const PuzzleHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(title: '퍼즐 기록'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const HistoryHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = list[index];
                  bool showDivider = true;
                  if (index != 0) {
                    final previous = list[index - 1];
                    showDivider =
                        data.endTime.toRelativeDate() !=
                        previous.endTime.toRelativeDate();
                  }
                  return HistoryCard(
                    level: data.level,
                    playTime: data.playTime,
                    endTime: data.endTime,
                    showDivider: showDivider,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
