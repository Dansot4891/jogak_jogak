sealed class MyPageAction {
  const factory MyPageAction.signout() = Signout;
}

class Signout implements MyPageAction {
  const Signout();
}
