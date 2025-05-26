import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_page.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_view_model.dart';
import 'package:provider/provider.dart';

class DeleteUserPageRoot extends StatelessWidget {
  const DeleteUserPageRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DeleteUserViewModel>();
    return BasePage(
      appBar: DefaultAppbar(title: LocaleKeys.resetPassword.tr()),
      body: DeleteUserPage(
        state: viewModel.state,
        onAction: viewModel.onAction,
      ),
    );
  }
}
