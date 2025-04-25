import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/core/helper/validator/app_validator.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_action.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_state.dart';

class ChangePasswordPage extends StatefulWidget {
  final ChangePasswordState state;
  final void Function(ChangePasswordAction action) onAction;
  const ChangePasswordPage({
    required this.state,
    required this.onAction,
    super.key,
  });

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomTextFormField(
              controller: _email,
              hintText: '이메일',
              validator: AppValidator.emailValid,
            ),
            const SizedBox(height: 20),
            AppButton(
              text: '메일 발송',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  AppShowDialog.show(
                    context,
                    AppDialog.doubleBtns(
                      title: '비밀번호 재설정',
                      subText: '해당 이메일로\n비밀번호 재설정 메일이 전송됩니다.',
                      btnLeftText: '취소',
                      btnRightText: '확인',
                      onBtnLeftClicked: () {
                        pop(context);
                      },
                      onBtnRightClicked: () async {
                        pop(context);
                        widget.onAction(
                          ChangePasswordAction.sendToEmail(_email.text),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
