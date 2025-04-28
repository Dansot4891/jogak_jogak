// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';

import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_action.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_event.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_state.dart';
import 'package:jogak_jogak/presentation/system/system_provider.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class SignInViewModel with ChangeNotifier {
  final UserProvider _userProvider;
  final SystemProvider _systemProvider;

  SignInViewModel({
    required UserProvider userProvider,
    required SystemProvider systemProvider,
  }) : _userProvider = userProvider,
       _systemProvider = systemProvider;

  SignInState _state = SignInState();
  SignInState get state => _state;

  final StreamController<SignInEvent> _streamController =
      StreamController<SignInEvent>();
  Stream<SignInEvent> get streamEvent => _streamController.stream;

  void onAction(SignInAction action) {
    switch (action) {
      case SignIn():
        _signIn(email: action.email, password: action.password);
      case AutoSignIn():
        _autoSignIn();
      case CheckVersion():
        _checkVersion();
    }
  }

  void _signIn({required String email, required String password}) async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _userProvider.signIn(email: email, password: password);
    if (result) {
      _state = state.copyWith(state: BaseState.success);
      notifyListeners();
    } else {
      _state = state.copyWith(state: BaseState.error);
      _streamController.add(
        const SignInEvent.showSignInErrorDialog('로그인에 실패하였습니다.'),
      );
      notifyListeners();
    }
  }

  void _autoSignIn() async {
    await _userProvider.autoSignIn();
    FlutterNativeSplash.remove();
    notifyListeners();
  }

  void _checkVersion() async {
    final result = await _systemProvider.checkVersion();
    switch (result) {
      case Success<bool>():
        return;
      case Error<bool>():
        _streamController.add(
          SignInEvent.showSignInErrorDialog(result.error.message),
        );
    }
  }
}
