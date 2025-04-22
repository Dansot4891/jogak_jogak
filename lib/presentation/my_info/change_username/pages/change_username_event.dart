sealed class ChangeUsernameEvent {
  const factory ChangeUsernameEvent.showUsernameDialog(String message) =
      ShowUsernameDialog;
}

class ShowUsernameDialog implements ChangeUsernameEvent {
  final String message;
  const ShowUsernameDialog(this.message);
}
