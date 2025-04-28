sealed class SystemEvent {
  const factory SystemEvent.showErrorDialog(String text) = ShowErrorDialog;
}

class ShowErrorDialog implements SystemEvent {
  final String text;

  const ShowErrorDialog(this.text);
}
