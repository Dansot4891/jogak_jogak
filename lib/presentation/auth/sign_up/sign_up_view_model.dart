import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/check_username_use_case.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/sign_up_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

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

  Future<bool> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _userProvider.signup(
      email: email,
      password: password,
      username: username,
    );
    switch (result) {
      case BaseState.success:
        _state = state.copyWith(state: BaseState.success);
        notifyListeners();
        return true;
      default:
        _state = state.copyWith(state: BaseState.error);
        notifyListeners();
        return false;
    }
  }

  void checkUsername(String username) async {
    final result = await _checkUsernameUseCase.execute(username);
    switch (result) {
      case Success<bool>():
        _state = state.copyWith(isAbleUsername: result.data);
      case Error<bool>():
        _state = state.copyWith(state: BaseState.error);
    }
  }

  void resetIsAbleUsername() {
    _state = state.copyWith(isAbleUsername: null);
  }
}
