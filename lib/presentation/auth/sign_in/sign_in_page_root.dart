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
    super.initState();
    final viewModel = context.read<SignInViewModel>();
    viewModel.onAction(const SignInAction.signInInitialize());
    try {
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
    } on StateError catch (e, st) {
      // 여기서 두 번째 listen() 이 던지는 에러를 잡고,
      // st(스택트레이스) 에 “어디서” 호출됐는지 다 나옵니다.
      // print(e);
      print(st);
      // debugPrint('$st');
    }
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
