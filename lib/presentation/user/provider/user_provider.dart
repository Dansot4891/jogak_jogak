import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/auth/data/repository/auth_repository.dart';
import 'package:jogak_jogak/feature/user/data/model/user.dart';
import 'package:jogak_jogak/feature/user/data/repository/user_repository.dart';
import 'package:jogak_jogak/presentation/user/state/user_state.dart';

class UserProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  UserProvider({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) : _authRepository = authRepository,
       _userRepository = userRepository;

  UserState _state = const UserState();
  UserState get state => _state;

  void signIn({required String email, required String password}) async {
    final loginResult = await _authRepository.signIn(
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
            _state = state.copyWith(user: userResult.data);
          case Error():
        }
      case Error():
    }
  }
}
