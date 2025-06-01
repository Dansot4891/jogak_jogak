import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncy_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:provider/provider.dart';

class SignUpPageRoot extends StatelessWidget {
  const SignUpPageRoot({super.key});

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
