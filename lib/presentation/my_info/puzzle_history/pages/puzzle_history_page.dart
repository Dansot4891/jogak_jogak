import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/helper/extension/date_time_extension.dart';
import 'package:jogak_jogak/core/helper/extension/timer_extension.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/module/state/state_handling.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/widgets/history_card.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/widgets/history_header.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/widgets/no_history.dart';

class PuzzleHistoryPage extends StatelessWidget {
  final PuzzleHistoryViewModel viewModel;
  const PuzzleHistoryPage(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(title: '퍼즐 기록'),
      body: ListenableBuilder(
        listenable: viewModel..getPuzzleHistory(),
        builder: (context, child) {
          final state = viewModel.state;
          return StateHandling(
            state: state.state,
            init: const BaseLoadingView(),
            loading: const BaseLoadingView(),
            error: BaseErrorView(state.errorMessage),
            success:
                state.history.isEmpty
                    ? const NoHistory()
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const HistoryHeader(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.history.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final data = state.history[index];
                                bool showDivider = true;
                                if (index != 0) {
                                  final previous = state.history[index - 1];
                                  showDivider =
                                      data.playDate.toRelativeDate() !=
                                      previous.playDate.toRelativeDate();
                                }
                                return HistoryCard(
                                  level: data.level,
                                  playTime: data.playTime.formattedElapsed(),
                                  playDate: data.playDate,
                                  showDivider: showDivider,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
          );
        },
      ),
    );
  }
}
