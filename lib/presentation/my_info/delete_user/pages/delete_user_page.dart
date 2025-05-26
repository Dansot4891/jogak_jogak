import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/core/helper/validator/app_validator.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_action.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_state.dart';

class DeleteUserPage extends StatefulWidget {
  final DeleteUserState state;
  final void Function(DeleteUserAction action) onAction;
  const DeleteUserPage({
    required this.state,
    required this.onAction,
    super.key,
  });

  @override
  State<DeleteUserPage> createState() => _DeleteUserPageState();
}

class _DeleteUserPageState extends State<DeleteUserPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
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
              maxLines: 1,
              hintText: LocaleKeys.emailHintText.tr(),
              validator: AppValidator.emailValid,
            ),
            const SizedBox(height: 20),
            AppButton(text: 'LocaleKeys.DeleteUserButton.tr()', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
