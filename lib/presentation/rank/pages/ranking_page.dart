import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/tabbar_page.dart';
import 'package:jogak_jogak/presentation/rank/widgets/ranking_tabview.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabbarPage(tabs: _tabs, children: _chilren);
  }

  static const List<String> _tabs = ['3 X 3', '4 X 4', '5 X 5'];
  static const List<Widget> _chilren = [
    RankingTabview(),
    RankingTabview(),
    RankingTabview(),
  ];
}
