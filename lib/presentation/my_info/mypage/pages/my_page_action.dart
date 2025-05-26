sealed class MyPageAction {
  const factory MyPageAction.signout() = Signout;

  const factory MyPageAction.withdrawal(String password) = Withdrawal;
}

class Signout implements MyPageAction {
  const Signout();
}

class Withdrawal implements MyPageAction {
  final String password;
  const Withdrawal(this.password);
}
