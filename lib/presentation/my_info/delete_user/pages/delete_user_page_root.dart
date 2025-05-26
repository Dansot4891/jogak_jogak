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
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_page.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_view_model.dart';
import 'package:provider/provider.dart';

class DeleteUserPageRoot extends StatefulWidget {
  const DeleteUserPageRoot({super.key});

  @override
  State<DeleteUserPageRoot> createState() => _DeleteUserPageRootState();
}

class _DeleteUserPageRootState extends State<DeleteUserPageRoot> {
  late StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final viewModel = context.read<DeleteUserViewModel>();
    //   _sub = viewModel.eventStream.listen((event) {
    //     if (mounted) {
    //       switch (event) {
    //         case ShowCheckDialog():
    //           AppShowDialog.show(
    //             context,
    //             AppDialog.singleBtn(
    //               title: event.message,
    //               btnText: LocaleKeys.ok,
    //               onBtnClicked: () {
    //                 pop(context);
    //               },
    //             ),
    //           );
    //       }
    //     }
    //   });
    // });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

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
