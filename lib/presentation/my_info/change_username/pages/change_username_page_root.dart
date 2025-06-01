import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_page.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_view_model.dart';
import 'package:provider/provider.dart';

class ChangeUsernamePageRoot extends StatelessWidget {
  const ChangeUsernamePageRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChangeUsernameViewModel>();
    return BasePage(
      appBar: DefaultAppbar(title: LocaleKeys.changeUsername.tr()),
      body: ChangeUsernamePage(
        state: viewModel.state,
        onAction: viewModel.onAction,
      ),
    );
  }
}
