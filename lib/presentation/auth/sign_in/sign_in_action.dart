sealed class SignInAction {
  const factory SignInAction.signIn({
    required String email,
    required String password,
  }) = SignIn;

  const factory SignInAction.autoSignIn() = AutoSignIn;
}

class SignIn implements SignInAction {
  final String email;
  final String password;
  const SignIn({required this.email, required this.password});
}

class AutoSignIn implements SignInAction {
  const AutoSignIn();
}
