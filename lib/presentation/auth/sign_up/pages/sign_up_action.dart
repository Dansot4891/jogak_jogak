sealed class SignUpAction {
  const factory SignUpAction.signup({
    required String email,
    required String password,
    required String username,
  }) = Signup;

  const factory SignUpAction.checkUsername(String username) = CheckUsername;

  const factory SignUpAction.resetIsAbleUsername() = ResetIsAbleUsername;
}

class Signup implements SignUpAction {
  final String email;
  final String password;
  final String username;
  const Signup({
    required this.email,
    required this.password,
    required this.username,
  });
}

class CheckUsername implements SignUpAction {
  final String username;
  const CheckUsername(this.username);
}

class ResetIsAbleUsername implements SignUpAction {
  const ResetIsAbleUsername();
}
