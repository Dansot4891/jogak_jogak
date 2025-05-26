sealed class DeleteUserAction {
  const factory DeleteUserAction.deleteUser(String email, String password) =
      DeleteUser;
}

class DeleteUser implements DeleteUserAction {
  final String email;
  final String password;
  const DeleteUser(this.email, this.password);
}
