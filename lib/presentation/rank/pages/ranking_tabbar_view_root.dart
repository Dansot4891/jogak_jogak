import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_action.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_tabview.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_view_model.dart';

class RankingTabviewRoot extends StatefulWidget {
  final int level;
  final RankingViewModel viewModel;
  const RankingTabviewRoot({
    required this.level,
    required this.viewModel,
    super.key,
  });

  @override
  State<RankingTabviewRoot> createState() => _RankingTabviewRootState();
}

class _RankingTabviewRootState extends State<RankingTabviewRoot> {
  @override
  void initState() {
    widget.viewModel.onAction(RankingAction.fetchRankings(widget.level));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return RankingTabview(
          level: widget.level,
          state: widget.viewModel.state,
          onAction: widget.viewModel.onAction,
        );
      },
    );
  }
}
