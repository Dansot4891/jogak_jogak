import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/presentation/auth/states/sign_in_state.dart';

class SignInViewModel extends ChangeNotifier {
  final SignInState _state = const SignInState();
  SignInState get state => _state;

  void signIn() async {}

  void resetPassword() async {}
}
