import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_view_model.dart';

class MyPageRoot extends StatelessWidget {
  final MyPageViewModel viewModel;
  const MyPageRoot(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return MyPage(state: viewModel.state, onAction: viewModel.onAction);
        },
      ),
    );
  }
}
