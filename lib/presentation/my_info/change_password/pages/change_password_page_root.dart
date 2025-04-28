import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_event.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_page.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_view_model.dart';

class ChangePasswordPageRoot extends StatefulWidget {
  final ChangePasswordViewModel viewModel;
  const ChangePasswordPageRoot(this.viewModel, {super.key});

  @override
  State<ChangePasswordPageRoot> createState() => _ChangePasswordPageRootState();
}

class _ChangePasswordPageRootState extends State<ChangePasswordPageRoot> {
  late StreamSubscription? _sub;

  @override
  void initState() {
    _sub = widget.viewModel.eventStream.listen((event) {
      print(event);
      if (mounted) {
        switch (event) {
          case ShowCheckDialog():
            AppShowDialog.show(
              context,
              AppDialog.singleBtn(
                title: event.message,
                btnText: LocaleKeys.ok,
                onBtnClicked: () {
                  pop(context);
                },
              ),
            );
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: DefaultAppbar(title: LocaleKeys.resetPassword.tr()),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return ChangePasswordPage(
            state: widget.viewModel.state,
            onAction: widget.viewModel.onAction,
          );
        },
      ),
    );
  }
}
