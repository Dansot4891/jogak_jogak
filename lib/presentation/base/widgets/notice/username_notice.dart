import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';

class UsernameNotice extends StatelessWidget {
  final bool? isAbleUsername;
  const UsernameNotice(this.isAbleUsername, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 40,
      child:
          isAbleUsername == null
              ? const Text('')
              : isAbleUsername == true
              ? Text(
                LocaleKeys.signUpOkText.tr(),
                style: AppTextStyle.body1.copyWith(color: AppColor.blue),
              )
              : Text(
                LocaleKeys.signUpNoText.tr(),
                style: AppTextStyle.body1.copyWith(color: AppColor.red),
              ),
    );
  }
}
