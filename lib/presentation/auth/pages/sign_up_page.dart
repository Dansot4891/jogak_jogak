import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/util/app_validator.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordCheck = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
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
              const SizedBox(height: 40),
              CustomTextFormField(
                controller: _password,
                hintText: '비밀번호 입력',
                obsecure: true,
                maxLines: 1,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _passwordCheck,
                hintText: '비밀번호 재확인',
                obsecure: true,
                maxLines: 1,
              ),
              const SizedBox(height: 16),
              AppButton(
                text: '회원가입',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    return;
                  }
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
