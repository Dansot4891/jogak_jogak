import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_action.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_state.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';

class SignInPage extends StatefulWidget {
  final SignInState state;
  final void Function(SignInAction action) onAction;
  const SignInPage({required this.state, required this.onAction, super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.state == BaseState.loading) {
      return const BaseLoadingView();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: AppSize.screenHeight),
          child: Column(
            children: [
              SizedBox(height: AppSize.fractionHeight(0.15)),
              Image.asset(AppImage.appLogo, width: AppSize.fractionWidth(0.6)),
              const SizedBox(height: 20),
              Text(LocaleKeys.appName.tr(), style: AppTextStyle.title1),
              const SizedBox(height: 40),
              CustomTextFormField(
                controller: _email,
                hintText: LocaleKeys.emailHintText.tr(),
                onChanged: (val) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _password,
                obsecure: true,
                maxLines: 1,
                hintText: LocaleKeys.passwordHintText.tr(),
                onChanged: (val) {
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        navigate(context, route: AppRoute.signUp);
                      },
                      child: Text(
                        LocaleKeys.signup.tr(),
                        style: AppTextStyle.body1,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        navigate(context, route: AppRoute.changePw);
                      },
                      child: Text(
                        LocaleKeys.resetPassword.tr(),
                        style: AppTextStyle.body1,
                      ),
                    ),
                  ],
                ),
              ),
              AppButton(
                text: LocaleKeys.login.tr(),
                onTap:
                    (_email.text.isEmpty || _password.text.isEmpty)
                        ? null
                        : () async {
                          widget.onAction(
                            SignInAction.signIn(
                              email: _email.text,
                              password: _password.text,
                            ),
                          );
                        },
              ),
              const SizedBox(height: 16),
              AppButton(
                text: LocaleKeys.unAuthButton.tr(),
                onTap: () async {
                  widget.onAction(const SignInAction.setUnCertifiedUser());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
