import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/helper/validator/app_validator.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _passwordCheck = TextEditingController();

  bool? isAbleUsername;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(),
      resizeToAvoidBottomInset: true,
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Spacer(),
                  Text('조각조각', style: AppTextStyle.title1),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    controller: _email,
                    hintText: '이메일 입력',
                    textInputType: TextInputType.emailAddress,
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
                            setState(() {
                              isAbleUsername = null;
                            });
                          },
                          validator: AppValidator.emailValid,
                        ),
                      ),
                      const SizedBox(width: 4),
                      AppButton(
                        text: '중복 확인',
                        horizontalPadding: 16,
                        onTap:
                            _name.text.isEmpty
                                ? null
                                : () async {
                                  final resp = await widget.viewModel
                                      .checkUsername(_name.text);
                                  isAbleUsername = resp;
                                  print('resp: $resp');
                                  setState(() {});
                                },
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: Text(noticeText),
                  ),
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
                        isAbleUsername == true &&
                                _password.text == _passwordCheck.text
                            ? () async {
                              if (_formKey.currentState!.validate()) {
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
                                        title: '에러가 발생하였습니다.',
                                        btnText: '확인',
                                        onBtnClicked: () {
                                          pop(context);
                                        },
                                      ),
                                    );
                                }
                              }
                            }
                            : null,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String get noticeText =>
      isAbleUsername == null
          ? ''
          : isAbleUsername == true
          ? '사용 가능한 닉네임입니다.'
          : '사용 불가능한 닉네임입니다.';
}
