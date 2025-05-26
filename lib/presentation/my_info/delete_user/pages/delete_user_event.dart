sealed class DeleteUserEvent {
  const factory DeleteUserEvent.deleteUserShowDialog(String message) =
      DeleteUserShowDialog;
}

class DeleteUserShowDialog implements DeleteUserEvent {
  final String message;
  const DeleteUserShowDialog(this.message);
}
