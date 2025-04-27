import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_view_model.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncy_page.dart';

class SignInPageRoot extends StatelessWidget {
  final SignInViewModel viewModel;
  const SignInPageRoot(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BouncyPage(
      resizeToAvoidBottomInset: true,
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return SignInPage(
            state: viewModel.state,
            onAction: viewModel.onAction,
          );
        },
      ),
    );
  }
}
