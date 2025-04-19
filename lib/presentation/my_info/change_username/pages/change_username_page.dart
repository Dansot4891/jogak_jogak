import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';

class ChangeUsernamePage extends StatelessWidget {
  const ChangeUsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(title: '닉네임 변경'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    hintText: '새로운 닉네임',
                  ),
                ),
                const SizedBox(width: 8),
                AppButton(text: '중복확인', horizontalPadding: 8, onTap: () {}),
              ],
            ),
            const SizedBox(height: 16),
            AppButton(text: '닉네임 변경', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
