sealed class ChangeUsernameAction {
  const factory ChangeUsernameAction.checkUsername(String username) =
      CheckUsername;

  const factory ChangeUsernameAction.changeUsername(String email) =
      ChangeUsername;

  const factory ChangeUsernameAction.resetIsAbleUsername() =
      ResetIsAbleUsername;
}

class CheckUsername implements ChangeUsernameAction {
  final String username;
  const CheckUsername(this.username);
}

class ChangeUsername implements ChangeUsernameAction {
  final String username;
  const ChangeUsername(this.username);
}

class ResetIsAbleUsername implements ChangeUsernameAction {
  const ResetIsAbleUsername();
}
