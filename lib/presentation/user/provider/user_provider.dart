import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_in_use_case.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_out_use_case.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_up_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/get_user_use_case.dart';
import 'package:jogak_jogak/presentation/user/provider/user_state.dart';

class UserProvider extends ChangeNotifier {
  final SignInUseCase _signInUseCase;
  final GetUserUseCase _getUserUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;

  UserProvider({
    required SignInUseCase signInUseCase,
    required GetUserUseCase getUserUseCase,
    required SignUpUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
  }) : _signInUseCase = signInUseCase,
       _getUserUseCase = getUserUseCase,
       _signUpUseCase = signUpUseCase,
       _signOutUseCase = signOutUseCase;

  UserState _state = const UserState();
  UserState get state => _state;

  // 로그인
  Future<Result<String>> signIn({
    required String email,
    required String password,
  }) async {
    final loginResult = await _signInUseCase.execute(
      email: email,
      password: password,
    );
    return loginResult;
  }

  Future<Result<void>> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    final result = await _signUpUseCase.execute(
      email: email,
      password: password,
      username: username,
    );
    return result;
  }

  void signout() async {
    final result = await _signOutUseCase.execute();
    switch (result) {
      case Success<void>():
        _state = state.resetUser();
        notifyListeners();
      case Error<void>():
    }
  }

  Future<void> autoLogin() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid;
      final result = await _getUserUseCase.execute(uid);
      switch (result) {
        case Success<AppUser>():
          _state = state.copyWith(user: result.data, state: BaseState.success);
          notifyListeners();
        case Error():
          _state = state.copyWith(
            state: BaseState.error,
            error: result.error.message,
          );
      }
    }
  }
}
