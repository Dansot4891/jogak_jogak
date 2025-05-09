import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_action.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_tabview.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_view_model.dart';
import 'package:provider/provider.dart';

class RankingTabviewRoot extends StatefulWidget {
  final int level;
  const RankingTabviewRoot({required this.level, super.key});

  @override
  State<RankingTabviewRoot> createState() => _RankingTabviewRootState();
}

class _RankingTabviewRootState extends State<RankingTabviewRoot> {
  @override
  void initState() {
    // 빌드 이후 안전하게 호출
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<RankingViewModel>();
      viewModel.onAction(RankingAction.fetchRankings(widget.level));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RankingViewModel>();
    return RankingTabview(
      level: widget.level,
      state: viewModel.state,
      onAction: viewModel.onAction,
    );
  }
}
