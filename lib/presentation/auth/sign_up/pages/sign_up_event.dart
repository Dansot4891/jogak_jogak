sealed class SignUpEvent {
  const factory SignUpEvent.showDialog(String messgae) = ShowDialog;
}

class ShowDialog implements SignUpEvent {
  final String message;
  const ShowDialog(this.message);
}
