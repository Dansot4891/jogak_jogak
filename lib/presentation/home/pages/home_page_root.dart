import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncy_page.dart';
import 'package:jogak_jogak/presentation/home/pages/home_page.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePageRoot extends StatelessWidget {
  const HomePageRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return BouncyPage(
      child: HomePage(state: viewModel.state, onAction: viewModel.onAction),
    );
  }
}
