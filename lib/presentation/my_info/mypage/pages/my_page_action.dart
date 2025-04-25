sealed class MyPageAction {
  const factory MyPageAction.signout() = Signout;

  const factory MyPageAction.withdrawal() = Withdrawal;
}

class Signout implements MyPageAction {
  const Signout();
}

class Withdrawal implements MyPageAction {
  const Withdrawal();
}
