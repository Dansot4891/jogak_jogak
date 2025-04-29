import 'package:easy_localization/easy_localization.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';

abstract class AppValidator {
  static String? emailValid(String? input) {
    if (input == null || input.isEmpty) {
      return LocaleKeys.validationEmailValidateText.tr();
    }
    final regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (!regex.hasMatch(input)) {
      return LocaleKeys.validationEmailFormValidateText.tr();
    }

    return null; // 유효할 경우 null 반환
  }

  static String? passwordValid(String? input) {
    if (input == null || input.isEmpty) {
      return LocaleKeys.validationPasswordValidateText.tr();
    }
    if (input.length < 6) {
      return LocaleKeys.validationPasswordFormValidateText.tr();
    }

    return null; // 유효할 경우 null 반환
  }
}
