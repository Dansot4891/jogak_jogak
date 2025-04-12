import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';

class UpdateNicknameScreen extends StatelessWidget {
  const UpdateNicknameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(title: '비밀번호 변경'),
      body: Column(children: [AppButton(text: '닉네임 변경', onTap: () {})]),
    );
  }
}
