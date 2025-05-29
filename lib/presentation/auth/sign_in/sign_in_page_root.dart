import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_action.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_view_model.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncy_page.dart';
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
