import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_page.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_view_model.dart';
import 'package:provider/provider.dart';

class ChangePasswordPageRoot extends StatelessWidget {
  const ChangePasswordPageRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChangePasswordViewModel>();
    return BasePage(
      appBar: DefaultAppbar(title: LocaleKeys.resetPassword.tr()),
      body: ChangePasswordPage(
        state: viewModel.state,
        onAction: viewModel.onAction,
      ),
    );
  }
}
