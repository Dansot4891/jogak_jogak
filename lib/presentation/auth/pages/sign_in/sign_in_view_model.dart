import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_in/sign_in_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class SignInViewModel with ChangeNotifier {
  final UserProvider _userProvider;
  SignInViewModel(this._userProvider);

  SignInState _state = const SignInState();
  SignInState get state => _state;

  void signUp({required String email, required String password}) async {
    _state = state.copyWith(state: BaseState.loading);
    final result = await _userProvider.signIn(email: email, password: password);
    _state = state.copyWith(state: result);
  }
}
