import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_action.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_page.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_view_model.dart';

class PuzzleHistoryPageRoot extends StatefulWidget {
  final PuzzleHistoryViewModel viewModel;
  const PuzzleHistoryPageRoot(this.viewModel, {super.key});

  @override
  State<PuzzleHistoryPageRoot> createState() => _PuzzleHistoryPageRootState();
}

class _PuzzleHistoryPageRootState extends State<PuzzleHistoryPageRoot> {
  @override
  void initState() {
    widget.viewModel.onAction(const PuzzleHistoryAction.getPuzzleHistory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: DefaultAppbar(title: LocaleKeys.history.tr()),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return PuzzleHistoryPage(
            state: widget.viewModel.state,
            onAction: widget.viewModel.onAction,
          );
        },
      ),
    );
  }
}
