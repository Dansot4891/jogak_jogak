import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/change_password_use_case.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_action.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_event.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_state.dart';

class ChangePasswordViewModel with ChangeNotifier {
  final ChangePasswordUseCase _changePasswordUseCase;

  ChangePasswordViewModel(this._changePasswordUseCase);

  ChangePasswordState _state = const ChangePasswordState();
  ChangePasswordState get state => _state;

  final _streamController = StreamController<ChangePasswordEvent>();
  Stream<ChangePasswordEvent> get eventStream => _streamController.stream;

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
        _streamController.add(
          const ChangePasswordEvent.showCheckDialog('메시지가 발송되었습니다.'),
        );
        notifyListeners();
      case Error<void>():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: result.error.message,
        );
        _streamController.add(
          const ChangePasswordEvent.showCheckDialog('에러가 발생하였습니다..'),
        );
        notifyListeners();
    }
  }
}
