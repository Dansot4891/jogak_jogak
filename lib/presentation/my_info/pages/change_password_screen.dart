import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(title: '비밀번호 변경'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: '현재 비밀번호',
            ),
            const SizedBox(height: 32),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: '새 비밀번호',
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: '새 비밀번호 확인',
            ),
            const SizedBox(height: 16),
            AppButton(text: '닉네임 변경', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
