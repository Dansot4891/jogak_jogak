import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class SignInViewModel with ChangeNotifier {
  final UserProvider _userProvider;
  SignInViewModel(this._userProvider);

  void signUp({required String email, required String password}) async {
    await _userProvider.signIn(email: email, password: password);
  }
}
