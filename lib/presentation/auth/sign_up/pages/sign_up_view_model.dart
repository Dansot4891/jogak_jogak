import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/check_username_use_case.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_action.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_state.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';
import 'package:ui_event_bus/ui_event_bus.dart';

class SignUpViewModel with ChangeNotifier {
  final UserProvider _userProvider;
  final CheckUsernameUseCase _checkUsernameUseCase;
  SignUpViewModel({
    required UserProvider userProvider,
    required CheckUsernameUseCase checkUsernameUseCase,
  }) : _userProvider = userProvider,
       _checkUsernameUseCase = checkUsernameUseCase;

  SignupState _state = SignupState();
  SignupState get state => _state;

  void onAction(SignUpAction action) {
    switch (action) {
      case Signup():
        _signup(
          email: action.email,
          password: action.password,
          username: action.username,
        );
      case CheckUsername():
        _checkUsername(action.username);
      case ResetIsAbleUsername():
        _resetIsAbleUsername();
    }
  }

  Future<bool> _signup({
    required String email,
    required String password,
    required String username,
  }) async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final signupResult = await _userProvider.signup(
      email: email,
      password: password,
      username: username,
    );
    switch (signupResult) {
      case Success<void>():
        _state = state.copyWith(state: BaseState.success);
        notifyListeners();
        return true;
      case Error<void>():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: signupResult.error.message,
        );
        EventHelpers.showDialog(
          builder:
              (ctx) => AppDialog.singleBtn(
                title: state.errorMessage,
                btnText: LocaleKeys.ok.tr(),
                onBtnClicked: () {
                  pop(ctx);
                },
              ),
        );
        notifyListeners();
        return false;
    }
  }

  void _checkUsername(String username) async {
    final result = await _checkUsernameUseCase.execute(username);
    switch (result) {
      case Success<bool>():
        _state = state.copyWith(isAbleUsername: result.data);
      case Error<bool>():
        // 에러시 stream에 데이터 넣기
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: result.error.message,
        );
        EventHelpers.showDialog(
          builder:
              (ctx) => AppDialog.singleBtn(
                title: state.errorMessage,
                btnText: LocaleKeys.ok.tr(),
                onBtnClicked: () {
                  pop(ctx);
                },
              ),
        );
    }
    notifyListeners();
  }

  void _resetIsAbleUsername() {
    _state = state.resetIsAbleUsername();
    notifyListeners();
  }
}
