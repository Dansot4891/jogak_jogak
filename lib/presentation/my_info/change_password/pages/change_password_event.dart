sealed class ChangePasswordEvent {
  const factory ChangePasswordEvent.showCheckDialog(String message) =
      ShowCheckDialog;
}

class ShowCheckDialog implements ChangePasswordEvent {
  final String message;
  const ShowCheckDialog(this.message);
}
