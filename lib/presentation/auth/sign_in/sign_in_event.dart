sealed class SignInEvent {
  const factory SignInEvent.showSignInErrorDialog(String text) =
      ShowSignInErrorDialog;
  const factory SignInEvent.showSystemErrorDialog(String text) =
      ShowSystemErrorDialog;
}

class ShowSignInErrorDialog implements SignInEvent {
  final String text;

  const ShowSignInErrorDialog(this.text);
}

class ShowSystemErrorDialog implements SignInEvent {
  final String text;

  const ShowSystemErrorDialog(this.text);
}
