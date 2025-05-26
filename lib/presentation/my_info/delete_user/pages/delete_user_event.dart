sealed class DeleteUserEvent {
  const factory DeleteUserEvent.showCheckDialog(String message) =
      ShowCheckDialog;
}

class ShowCheckDialog implements DeleteUserEvent {
  final String message;
  const ShowCheckDialog(this.message);
}
