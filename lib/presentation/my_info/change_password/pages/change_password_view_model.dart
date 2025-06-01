import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/change_password_use_case.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_action.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_state.dart';
import 'package:ui_event_bus/ui_event_bus.dart';

class ChangePasswordViewModel with ChangeNotifier {
  final ChangePasswordUseCase _changePasswordUseCase;

  ChangePasswordViewModel(this._changePasswordUseCase);

  ChangePasswordState _state = const ChangePasswordState();
  ChangePasswordState get state => _state;

  void onAction(ChangePasswordAction action) {
    switch (action) {
      case SendToEmail():
        _sendToEmail(action.email);
    }
  }

  Future<void> _sendToEmail(String email) async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _changePasswordUseCase.execute(email);
    switch (result) {
      case Success<void>():
        _state = state.copyWith(state: BaseState.success);
        EventHelpers.showDialog(
          builder:
              (ctx) => AppDialog.singleBtn(
                title: LocaleKeys.sendedMail.tr(),
                btnText: LocaleKeys.ok.tr(),
                onBtnClicked: () {
                  pop(ctx);
                },
              ),
        );
        notifyListeners();
      case Error<void>():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: result.error.message,
        );
        EventHelpers.showDialog(
          builder:
              (ctx) => AppDialog.singleBtn(
                title: LocaleKeys.error.tr(),
                btnText: LocaleKeys.ok.tr(),
                onBtnClicked: () {
                  pop(ctx);
                },
              ),
        );
        notifyListeners();
    }
  }
}
