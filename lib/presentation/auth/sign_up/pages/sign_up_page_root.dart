import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_event.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';

class SignUpPageRoot extends StatefulWidget {
  final SignUpViewModel viewModel;
  const SignUpPageRoot(this.viewModel, {super.key});

  @override
  State<SignUpPageRoot> createState() => _SignUpPageRootState();
}

class _SignUpPageRootState extends State<SignUpPageRoot> {
  late SignUpViewModel viewModel;
  late StreamSubscription? sub;

  @override
  void initState() {
    viewModel = widget.viewModel;
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
    super.initState();
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      appBar: const DefaultAppbar(),
      resizeToAvoidBottomInset: true,
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return SignUpPage(
            state: viewModel.state,
            onAction: viewModel.onAction,
          );
        },
      ),
    );
  }
}
