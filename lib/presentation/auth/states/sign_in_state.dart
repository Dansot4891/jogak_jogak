class SignInState {
  final bool buttonValue;
  const SignInState({this.buttonValue = false});

  SignInState copyWith({bool? buttonValue}) {
    return SignInState(buttonValue: buttonValue ?? this.buttonValue);
  }
}
