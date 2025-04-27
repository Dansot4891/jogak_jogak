sealed class SignInEvent {
  const factory SignInEvent.showErrorDialog(String text) = ShowErrorDialog;
}

class ShowErrorDialog implements SignInEvent {
  final String text;

  const ShowErrorDialog(this.text);
}
