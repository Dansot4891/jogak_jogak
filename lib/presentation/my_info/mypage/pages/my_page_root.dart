import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_view_model.dart';
import 'package:provider/provider.dart';

class MyPageRoot extends StatelessWidget {
  const MyPageRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyPageViewModel>();
    return BasePage(
      body: MyPage(state: viewModel.state, onAction: viewModel.onAction),
    );
  }
}
