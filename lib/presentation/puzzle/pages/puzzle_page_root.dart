import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_action.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_page.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_view_model.dart';
import 'package:provider/provider.dart';

class PuzzlePageRoot extends StatefulWidget {
  const PuzzlePageRoot({super.key});

  @override
  State<PuzzlePageRoot> createState() => _PuzzlePageRootState();
}

class _PuzzlePageRootState extends State<PuzzlePageRoot> {
  @override
  void initState() {
    final viewModel = context.read<PuzzleViewModel>();
    viewModel.onAction(const Initialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PuzzleViewModel>();
    return PuzzlePage(state: viewModel.state, onAction: viewModel.onAction);
  }
}
