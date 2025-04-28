import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/helper/validator/app_validator.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_action.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_state.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/widgets/sign_up_complete.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/notice/username_notice.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';

class SignUpPage extends StatefulWidget {
  final SignupState state;
  final void Function(SignUpAction action) onAction;
  const SignUpPage({required this.state, required this.onAction, super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _passwordCheck = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    _password.dispose();
    _passwordCheck.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.state == BaseState.loading) {
      return const BaseLoadingView();
    }
    if (widget.state.state == BaseState.success) {
      return const SignUpComplete();
    }
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: AppSize.screenHeight),
            child: Column(
              children: [
                Image.asset(
                  AppImage.appLogo,
                  width: AppSize.fractionWidth(0.6),
                ),
                const SizedBox(height: 20),
                Text(LocaleKeys.appName.tr(), style: AppTextStyle.title1),
                const SizedBox(height: 40),
                CustomTextFormField(
                  controller: _email,
                  hintText: LocaleKeys.emailHintText.tr(),
                  textInputType: TextInputType.emailAddress,
                  validator: AppValidator.emailValid,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: _name,
                        hintText: LocaleKeys.usernameHintText.tr(),
                        maxLength: 10,
                        onChanged:
                            (val) => widget.onAction(
                              const SignUpAction.resetIsAbleUsername(),
                            ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    AppButton(
                      text: LocaleKeys.signUpDuplicate.tr(),
                      horizontalPadding: 16,
                      onTap:
                          _name.text.isEmpty
                              ? null
                              : () async {
                                widget.onAction(
                                  SignUpAction.checkUsername(_name.text),
                                );
                              },
                    ),
                  ],
                ),
                UsernameNotice(widget.state.isAbleUsername),
                CustomTextFormField(
                  controller: _password,
                  hintText: LocaleKeys.passwordHintText.tr(),
                  obsecure: true,
                  maxLines: 1,
                  validator: AppValidator.passwordValid,
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: _passwordCheck,
                  hintText: LocaleKeys.signUpCheckPasswordHintText.tr(),
                  obsecure: true,
                  maxLines: 1,
                  validator: AppValidator.passwordValid,
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),
                AppButton(
                  text: LocaleKeys.signup.tr(),
                  onTap:
                      widget.state.isAbleUsername == true &&
                              _password.text == _passwordCheck.text
                          ? () async {
                            if (_formKey.currentState!.validate()) {
                              widget.onAction(
                                SignUpAction.signup(
                                  email: _email.text,
                                  password: _password.text,
                                  username: _name.text,
                                ),
                              );
                            }
                          }
                          : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
