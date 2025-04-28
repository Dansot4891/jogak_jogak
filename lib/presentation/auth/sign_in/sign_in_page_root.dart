import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_action.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_event.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_view_model.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncy_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';

class SignInPageRoot extends StatefulWidget {
  final SignInViewModel viewModel;
  const SignInPageRoot(this.viewModel, {super.key});

  @override
  State<SignInPageRoot> createState() => _SignInPageRootState();
}

class _SignInPageRootState extends State<SignInPageRoot> {
  StreamSubscription? _sub;

  @override
  void initState() {
    widget.viewModel.onAction(const SignInAction.signInInitialize());
    _sub = widget.viewModel.streamEvent.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowSignInErrorDialog():
            AppShowDialog.show(
              context,
              AppDialog.singleBtn(
                title: event.text,
                btnText: '확인',
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
                btnText: '확인',
                onBtnClicked: () {},
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
    return BouncyPage(
      resizeToAvoidBottomInset: true,
      child: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return SignInPage(
            state: widget.viewModel.state,
            onAction: widget.viewModel.onAction,
          );
        },
      ),
    );
  }
}
