import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/text_style.dart';
import 'package:jogak_jogak/presentation/page/base/base_page.dart';
import 'package:jogak_jogak/presentation/widgets/base/button/app_button.dart';
import 'package:jogak_jogak/presentation/widgets/base/text_field/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Spacer(),
            Icon(Icons.local_pizza_outlined, size: 160),
            Text('조각조각', style: AppTextStyle.title1),
            SizedBox(height: 12),
            CustomTextFormField(controller: _email, hintText: '이메일 입력'),
            SizedBox(height: 8),
            CustomTextFormField(controller: _password, hintText: '비밀번호 입력'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('회원가입', style: AppTextStyle.body1),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('비밀번호 찾기', style: AppTextStyle.body1),
                  ),
                ],
              ),
            ),
            AppButton(text: '로그인', onTap: () {}),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
