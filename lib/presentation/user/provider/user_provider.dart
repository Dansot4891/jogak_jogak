import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_in_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';
import 'package:jogak_jogak/presentation/user/state/user_state.dart';

class UserProvider extends ChangeNotifier {
  final SignInUseCase _signInUseCase;
  final UserRepository _userRepository;

  UserProvider({
    required SignInUseCase signInUseCase,
    required UserRepository userRepository,
  }) : _signInUseCase = signInUseCase,
       _userRepository = userRepository;

  UserState _state = const UserState();
  UserState get state => _state;

  // 로그인
  void signIn({required String email, required String password}) async {
    final loginResult = await _signInUseCase.execute(
      email: email,
      password: password,
    );
    // 로그인 결과
    switch (loginResult) {
      case Success<String>():
        final userResult = await _userRepository.getUser(loginResult.data);
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
  }
}
