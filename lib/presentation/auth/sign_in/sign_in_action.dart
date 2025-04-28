sealed class SignInAction {
  const factory SignInAction.signIn({
    required String email,
    required String password,
  }) = SignIn;

  const factory SignInAction.signInInitialize() = SignInInitialize;
}

class SignIn implements SignInAction {
  final String email;
  final String password;
  const SignIn({required this.email, required this.password});
}

class SignInInitialize implements SignInAction {
  const SignInInitialize();
}
