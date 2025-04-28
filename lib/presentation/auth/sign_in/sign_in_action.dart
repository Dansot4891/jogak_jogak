sealed class SignInAction {
  const factory SignInAction.signIn({
    required String email,
    required String password,
  }) = SignIn;

  const factory SignInAction.autoSignIn() = AutoSignIn;

  const factory SignInAction.checkVersion() = CheckVersion;
}

class SignIn implements SignInAction {
  final String email;
  final String password;
  const SignIn({required this.email, required this.password});
}

class AutoSignIn implements SignInAction {
  const AutoSignIn();
}

class CheckVersion implements SignInAction {
  const CheckVersion();
}
