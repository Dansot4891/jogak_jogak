import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_action.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_event.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_view_model.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncy_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:provider/provider.dart';

class SignInPageRoot extends StatefulWidget {
  const SignInPageRoot({super.key});

  @override
  State<SignInPageRoot> createState() => _SignInPageRootState();
}

class _SignInPageRootState extends State<SignInPageRoot> {
  StreamSubscription? _sub;

  @override
  void initState() {
    final viewModel = context.read<SignInViewModel>();
    viewModel.onAction(const SignInAction.signInInitialize());
    _sub = viewModel.streamEvent.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowSignInErrorDialog():
            AppShowDialog.show(
              context,
              AppDialog.singleBtn(
                title: event.text,
                btnText: LocaleKeys.ok.tr(),
                onBtnClicked: () {
                  pop(context);
                },
              ),
            );
          case ShowVersionErrorDialog():
            AppShowDialog.show(
              context,
              barrierDismissible: false,
              AppDialog.singleBtn(
                title: event.text,
                btnText: LocaleKeys.ok.tr(),
                onBtnClicked: () {
                  viewModel.onAction(const SignInAction.redirectStoreUrl());
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
    final viewModel = context.watch<SignInViewModel>();
    return BouncyPage(
      resizeToAvoidBottomInset: true,
      child: SignInPage(state: viewModel.state, onAction: viewModel.onAction),
    );
  }
}
