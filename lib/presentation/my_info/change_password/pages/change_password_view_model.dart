import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/change_password_use_case.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_action.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_state.dart';

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

  Future<String> _sendToEmail(String email) async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _changePasswordUseCase.execute(email);
    switch (result) {
      case Success<void>():
        _state = state.copyWith(state: BaseState.success);
        notifyListeners();
        return '이메일이 발송되었습니다.';
      case Error<void>():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: result.error.message,
        );
        notifyListeners();
        return '에러가 발생하였습니다.';
    }
  }
}
