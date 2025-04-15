import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/feature/auth/data/repository/auth_repository.dart';
import 'package:jogak_jogak/feature/user/data/model/user.dart';
import 'package:jogak_jogak/feature/user/data/repository/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  UserProvider({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) : _authRepository = authRepository,
       _userRepository = userRepository;

  AppUser? _state;
  AppUser? get state => _state;

  void signIn({required String email, required String password}) async {}
}
