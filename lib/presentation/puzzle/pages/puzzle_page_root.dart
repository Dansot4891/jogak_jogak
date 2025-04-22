import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_action.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_page.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_view_model.dart';

class PuzzlePageRoot extends StatefulWidget {
  final PuzzleViewModel viewModel;
  const PuzzlePageRoot(this.viewModel, {super.key});

  @override
  State<PuzzlePageRoot> createState() => _PuzzlePageRootState();
}

class _PuzzlePageRootState extends State<PuzzlePageRoot> {
  @override
  void initState() {
    widget.viewModel.onAction(const Initialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return PuzzlePage(
          state: widget.viewModel.state,
          onAction: widget.viewModel.onAction,
        );
      },
    );
  }
}
