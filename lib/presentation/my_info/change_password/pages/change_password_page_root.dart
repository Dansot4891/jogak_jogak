import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_page.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_view_model.dart';

class ChangePasswordPageRoot extends StatelessWidget {
  final ChangePasswordViewModel viewModel;
  const ChangePasswordPageRoot(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(title: '비밀번호 변경'),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return ChangePasswordPage(
            state: viewModel.state,
            onAction: viewModel.onAction,
          );
        },
      ),
    );
  }
}
