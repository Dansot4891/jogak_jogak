import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_view_model.dart';

class ChangePasswordPage extends StatefulWidget {
  final ChangePasswordViewModel viewModel;
  const ChangePasswordPage(this.viewModel, {super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(title: '비밀번호 변경'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomTextFormField(controller: _email, hintText: '이메일'),
            const SizedBox(height: 20),
            AppButton(
              text: '메일 발송',
              onTap: () {
                AppShowDialog.show(
                  context,
                  AppDialog.doubleBtns(
                    title: '비밀번호 재설정',
                    subText: '해당 이메일로\n비밀번호 재설정 메일이 전송됩니다.',
                    btnLeftText: '취소',
                    btnRightText: '확인',
                    onBtnLeftClicked: () {},
                    onBtnRightClicked: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
