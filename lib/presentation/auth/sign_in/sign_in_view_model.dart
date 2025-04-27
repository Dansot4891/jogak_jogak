import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_action.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_event.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class SignInViewModel with ChangeNotifier {
  final UserProvider _userProvider;

  SignInViewModel(this._userProvider);

  SignInState _state = SignInState();
  SignInState get state => _state;

  final StreamController<SignInEvent> _streamController =
      StreamController<SignInEvent>();
  Stream<SignInEvent> get streamEvent => _streamController.stream;

  void onAction(SignInAction action) {
    switch (action) {
      case SignIn():
        signIn(email: action.email, password: action.password);
      case AutoSignIn():
        autoSignIn();
    }
  }

  void signIn({required String email, required String password}) async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _userProvider.signIn(email: email, password: password);
    if (result) {
      _state = state.copyWith(state: BaseState.success);
      notifyListeners();
    } else {
      _state = state.copyWith(state: BaseState.error);
      _streamController.add(const SignInEvent.showErrorDialog('로그인에 실패하였습니다.'));
      notifyListeners();
    }
  }

  void autoSignIn() async {
    await _userProvider.autoSignIn();
    FlutterNativeSplash.remove();
    notifyListeners();
  }
}
