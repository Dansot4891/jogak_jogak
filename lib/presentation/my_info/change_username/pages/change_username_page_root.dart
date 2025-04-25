import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_event.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_page.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_view_model.dart';

class ChangeUsernamePageRoot extends StatefulWidget {
  final ChangeUsernameViewModel viewModel;
  const ChangeUsernamePageRoot(this.viewModel, {super.key});

  @override
  State<ChangeUsernamePageRoot> createState() => _ChangeUsernamePageRootState();
}

class _ChangeUsernamePageRootState extends State<ChangeUsernamePageRoot> {
  late StreamSubscription? _sub;

  @override
  void initState() {
    _sub = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowUsernameDialog():
            AppShowDialog.show(
              context,
              AppDialog.singleBtn(
                title: event.message,
                btnText: '확인',
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
      appBar: const DefaultAppbar(title: '닉네임 변경'),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return ChangeUsernamePage(
            state: widget.viewModel.state,
            onAction: widget.viewModel.onAction,
          );
        },
      ),
    );
  }
}
