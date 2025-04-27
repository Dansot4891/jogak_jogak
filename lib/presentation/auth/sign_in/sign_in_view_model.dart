import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_action.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class SignInViewModel with ChangeNotifier {
  final UserProvider _userProvider;

  SignInViewModel(this._userProvider);

  SignInState _state = SignInState();
  SignInState get state => _state;

  void onAction(SignInAction action) {
    switch (action) {
      case SignIn():
        signIn(email: action.email, password: action.password);
    }
  }

  void signIn({required String email, required String password}) async {
    final result = await _userProvider.signIn(email: email, password: password);
    if (result) {
      _state = state.copyWith(state: BaseState.success);
    } else {
      _state = state.copyWith(state: BaseState.error);
    }
  }
}
