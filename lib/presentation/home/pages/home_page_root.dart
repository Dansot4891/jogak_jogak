import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncy_page.dart';
import 'package:jogak_jogak/presentation/home/pages/home_page.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';

class HomePageRoot extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomePageRoot(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BouncyPage(
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return HomePage(state: viewModel.state, onAction: viewModel.onAction);
        },
      ),
    );
  }
}
