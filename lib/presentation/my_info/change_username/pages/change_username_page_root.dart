import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_event.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_page.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_view_model.dart';
import 'package:provider/provider.dart';

class ChangeUsernamePageRoot extends StatefulWidget {
  const ChangeUsernamePageRoot({super.key});

  @override
  State<ChangeUsernamePageRoot> createState() => _ChangeUsernamePageRootState();
}

class _ChangeUsernamePageRootState extends State<ChangeUsernamePageRoot> {
  late StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<ChangeUsernameViewModel>();
    _sub = viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowUsernameDialog():
            AppShowDialog.show(
              context,
              AppDialog.singleBtn(
                title: event.message.tr(),
                btnText: LocaleKeys.ok.tr(),
                onBtnClicked: () {
                  pop(context);
                },
              ),
            );
        }
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

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
