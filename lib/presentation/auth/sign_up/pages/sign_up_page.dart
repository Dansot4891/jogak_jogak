import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/helper/validator/app_validator.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/widgets/sign_up_complete.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/base/widgets/notice/username_notice.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';

class SignUpPage extends StatefulWidget {
  final SignUpViewModel viewModel;
  const SignUpPage(this.viewModel, {super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpViewModel viewModel;
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _passwordCheck = TextEditingController();

  @override
  void initState() {
    viewModel = widget.viewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      appBar: const DefaultAppbar(),
      resizeToAvoidBottomInset: true,
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          if (viewModel.state.state == BaseState.loading) {
            return const BaseLoadingView();
          }
          if (viewModel.state.state == BaseState.success) {
            return const SignUpComplete();
          }
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      AppImage.appLogo,
                      width: AppSize.fractionWidth(0.6),
                    ),
                    const SizedBox(height: 20),
                    Text('조각조각', style: AppTextStyle.title1),
                    const SizedBox(height: 40),
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
                            maxLength: 10,
                            onChanged: (val) {
                              viewModel.resetIsAbleUsername();
                            },
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
                                    viewModel.checkUsername(_name.text);
                                  },
                        ),
                      ],
                    ),
                    UsernameNotice(viewModel.state.isAbleUsername),
                    CustomTextFormField(
                      controller: _password,
                      hintText: '비밀번호 입력',
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
                      hintText: '비밀번호 재확인',
                      obsecure: true,
                      maxLines: 1,
                      validator: AppValidator.passwordValid,
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      text: '회원가입',
                      onTap:
                          viewModel.state.isAbleUsername == true &&
                                  _password.text == _passwordCheck.text
                              ? () async {
                                if (_formKey.currentState!.validate()) {
                                  final result = await viewModel.signup(
                                    email: _email.text,
                                    password: _password.text,
                                    username: _name.text,
                                  );
                                  if (!result) {
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
                              }
                              : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
