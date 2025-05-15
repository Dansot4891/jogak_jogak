import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_event.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncy_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:provider/provider.dart';

class SignUpPageRoot extends StatefulWidget {
  const SignUpPageRoot({super.key});

  @override
  State<SignUpPageRoot> createState() => _SignUpPageRootState();
}

class _SignUpPageRootState extends State<SignUpPageRoot> {
  late StreamSubscription? sub;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<SignUpViewModel>();
    sub = viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowDialog():
            AppShowDialog.show(
              context,
              AppDialog.singleBtn(
                title: viewModel.state.errorMessage,
                btnText: '확인',
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
    sub?.cancel();
    print('signup dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignUpViewModel>();
    return BouncyPage(
      appBar: const DefaultAppbar(),
      resizeToAvoidBottomInset: true,
      child: SignUpPage(state: viewModel.state, onAction: viewModel.onAction),
    );
  }
}
