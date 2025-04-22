sealed class ChangePasswordAction {
  const factory ChangePasswordAction.sendToEmail(String email) = SendToEmail;
}

class SendToEmail implements ChangePasswordAction {
  final String email;
  const SendToEmail(this.email);
}
