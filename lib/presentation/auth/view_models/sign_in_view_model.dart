import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/feature/auth/data/repository/auth_repository.dart';
import 'package:jogak_jogak/presentation/auth/states/sign_in_state.dart';

class SignInViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  SignInViewModel(this._authRepository);

  final SignInState _state = const SignInState();
  SignInState get state => _state;

  void signIn({required String email, required String password}) async {
    final response = await _authRepository.signIn(
      email: email,
      password: password,
    );
  }

  void resetPassword() async {}
}
