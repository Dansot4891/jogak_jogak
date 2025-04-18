import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_in_use_case.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_up_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/get_user_use_case.dart';
import 'package:jogak_jogak/presentation/user/provider/user_state.dart';

class UserProvider extends ChangeNotifier {
  final SignInUseCase _signInUseCase;
  final GetUserUseCase _getUserUseCase;
  final SignUpUseCase _signUpUseCase;

  UserProvider({
    required SignInUseCase signInUseCase,
    required GetUserUseCase getUserUseCase,
    required SignUpUseCase signUpUseCase,
  }) : _signInUseCase = signInUseCase,
       _getUserUseCase = getUserUseCase,
       _signUpUseCase = signUpUseCase;

  UserState _state = const UserState();
  UserState get state => _state;

  // 로그인
  Future<BaseState> signIn({
    required String email,
    required String password,
  }) async {
    final loginResult = await _signInUseCase.execute(
      email: email,
      password: password,
    );
    // 로그인 결과
    switch (loginResult) {
      case Success<String>():
        final userResult = await _getUserUseCase.execute(loginResult.data);
        // 유저 정보 조회 결과
        switch (userResult) {
          case Success<AppUser>():
            _state = state.copyWith(
              user: userResult.data,
              state: BaseState.success,
            );
          case Error():
            _state = state.copyWith(
              state: BaseState.error,
              error: userResult.error.message,
            );
        }
      case Error():
        _state = state.copyWith(
          state: BaseState.error,
          error: loginResult.error.message,
        );
    }
    return state.state;
  }

  Future<BaseState> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    final result = await _signUpUseCase.execute(
      email: email,
      password: password,
      username: username,
    );
    switch (result) {
      case Success<void>():
        return BaseState.success;
      case Error<void>():
        return BaseState.error;
    }
  }
}
