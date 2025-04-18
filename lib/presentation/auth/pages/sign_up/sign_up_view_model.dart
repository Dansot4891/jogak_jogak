import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_up_use_case.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_up/sign_up_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class SignUpViewModel with ChangeNotifier {
  final UserProvider _userProvider;

  SignUpViewModel(this._userProvider);

  final SignUpState _state = const SignUpState();
  SignUpState get state => _state;

  // void signup({
  //   required String email,
  //   required String password,
  //   required String username,
  // }) async {
  //   final result = _signUpUseCase.execute(
  //     email: email,
  //     password: password,
  //     username: username,
  //   );
  //   switch (result) {
  //     case Success<void>():
  //   }
  // }
}
