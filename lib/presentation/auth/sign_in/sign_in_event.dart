sealed class SignInEvent {
  const factory SignInEvent.showSignInErrorDialog(String text) =
      ShowSignInErrorDialog;
}

class ShowSignInErrorDialog implements SignInEvent {
  final String text;

  const ShowSignInErrorDialog(this.text);
}
