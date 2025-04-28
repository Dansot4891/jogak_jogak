sealed class SignInEvent {
  const factory SignInEvent.showSignInErrorDialog(String text) =
      ShowSignInErrorDialog;
  const factory SignInEvent.showVersionErrorDialog(String text) =
      ShowVersionErrorDialog;
}

class ShowSignInErrorDialog implements SignInEvent {
  final String text;

  const ShowSignInErrorDialog(this.text);
}

class ShowVersionErrorDialog implements SignInEvent {
  final String text;

  const ShowVersionErrorDialog(this.text);
}
