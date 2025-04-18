import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/util/app_validator.dart';
import 'package:jogak_jogak/core/util/dialog/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class SignUpPage extends StatefulWidget {
  final SignUpViewModel viewModel;
  const SignUpPage(this.viewModel, {super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _passwordCheck = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(),
      resizeToAvoidBottomInset: true,
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Spacer(),
                Text('조각조각', style: AppTextStyle.title1),
                const SizedBox(height: 12),
                CustomTextFormField(
                  controller: _email,
                  hintText: '이메일 입력',
                  validator: AppValidator.emailValid,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: _name,
                        hintText: '닉네임 입력',
                        onChanged: (val) {
                          setState(() {});
                        },
                        validator: AppValidator.emailValid,
                      ),
                    ),
                    const SizedBox(width: 4),
                    AppButton(
                      text: '중복 확인',
                      horizontalPadding: 16,
                      onTap: _name.text.isEmpty ? null : () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomTextFormField(
                  controller: _password,
                  hintText: '비밀번호 입력',
                  obsecure: true,
                  maxLines: 1,
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: _passwordCheck,
                  hintText: '비밀번호 재확인',
                  obsecure: true,
                  maxLines: 1,
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),
                AppButton(
                  text: '회원가입',
                  onTap:
                      !widget.viewModel.state.isAbleUsername ||
                              !widget.viewModel.state.isRightPassword
                          ? null
                          : () async {
                            final UserProvider provider = locator();
                            final result = await provider.signup(
                              email: _email.text,
                              password: _password.text,
                              username: _name.text,
                            );
                            switch (result) {
                              case BaseState.success:
                                navigate(
                                  context,
                                  route: AppRoute.root,
                                  method: NavigationMethod.go,
                                );
                              default:
                                AppShowDialog.show(
                                  context,
                                  AppDialog.singleBtn(
                                    title: '로그인에 실패하였습니다.',
                                    btnText: '확인',
                                    onBtnClicked: () {
                                      pop(context);
                                    },
                                  ),
                                );
                            }
                          },
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
