import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/constants/app_data.dart';
import 'package:jogak_jogak/presentation/base/pages/tabbar_page.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_tabbar_view_root.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_view_model.dart';

class RankingPage extends StatelessWidget {
  final RankingViewModel viewModel;
  const RankingPage(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarPage(
      tabs: _tabs,
      children:
          AppData.levels
              .map((e) => RankingTabviewRoot(level: e, viewModel: viewModel))
              .toList(),
    );
  }

  static final List<String> _tabs =
      AppData.levels.map((e) => '$e X $e').toList();
}
